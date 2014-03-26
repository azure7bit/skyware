class ConversationsController < ApplicationController
  # before_filter :authenticate_super_admin!
  helper_method :mailbox, :conversation

  def index
    current_user.mailbox
    respond_to do |format|
      format.html
    end
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
  end

  def create
    recipient_email = conversation_params(:recipient).split(',') if conversation_params(:recipient)
    # recipient = Citizen.find_by(email: recipient_email)
    recipient_subdomain = conversation_params(:user_id).split(',').map{ |d| d.strip.gsub('@','') }
    recipient = Citizen.where("subdomain in (?) or email = ?", recipient_subdomain, recipient_email)
    recipient ||= SuperAdmin.find_by(email: recipient_email)

    recipient.map{|recipient| 
    conversation = current_user.
      send_message(recipient, *conversation_params(:body, :subject)).conversation
    }
    @recipient_name = recipient.map{|recipient| recipient.name}
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
    conversation.move_to_trash(current_super_admin)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_super_admin)
    redirect_to :conversations
  end

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
end
