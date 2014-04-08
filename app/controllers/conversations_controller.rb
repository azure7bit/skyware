class ConversationsController < ApplicationController
  # before_filter :authenticate_super_admin!
  helper_method :mailbox, :conversation
  before_filter :find_user_active
  
  def index
  end

  def new
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
    Conversation.new
    respond_to do |format|
      format.html
    end
  end

  def show
    current_user.mailbox
    respond_to do |format|
      format.html
    end
  end

  def create
    recipient_email = conversation_params(:recipient).split(',') if conversation_params(:recipient)
    if conversation_params(:user_id)
      recipient = conversation_params(:user_id).split(',').map{ |d| d.strip.gsub('@','') }
    elsif recipient_email
      recipient = Citizen.find_by(email: recipient_email)
    else
      recipient = Citizen.find_by(subdomain: request.subdomain)
    end

    recipient = Citizen.where("subdomain in (?) or email = ?", recipient, recipient_email) if conversation_params(:user_id)
    cc = Citizen.where("subdomain in (?) or email = ?", conversation_params(:cc).split(',').map{ |d| d.strip.gsub('@','') }, recipient_email) if conversation_params(:cc)
    recipient ||= SuperAdmin.find_by(email: recipient_email)

    if conversation_params(:user_id)
      recipient.map{|recipient|
        send_to = [recipient, cc].flatten
        conversation = current_user.send_message(send_to, *conversation_params(:body, :subject, :file)).conversation
      }
      @recipient_name = recipient.map{|recipient| recipient.name}
    else
      params[:conversation][:body] = params[:body_message].first if params[:body_message]
      conversation = current_user.
          send_message(recipient, *conversation_params(:body, :subject)).conversation
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Message sent successfully.' }
      format.js{
        flash[:notice] = "Message sent successfully"
      }
    end
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    # redirect_to :back, notice: "Message sent successfully to #{recipients.first.name}."
    redirect_to :back, notice: "Message sent successfully."
  end

  def trash
    conversation.move_to_trash(@access)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(@access)
    redirect_to :conversations
  end

  def sticky_post;end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end

  private
    def find_user_active
      @access = current_super_admin ? current_super_admin : current_business_user
    end
end
