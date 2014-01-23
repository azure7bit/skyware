# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	Dropzone.autoDiscover = false
	$("#company_docs_dropzone").dropzone
		url: "/docs",
		paramName: 'company_doc[company_document]'
		addRemoveLinks : true,
		maxFilesize: 0.5,
		dictResponseError: 'Error uploading file!'
		init: ->
			that = this
			this.on "sending", (file, xhr) ->
				$.rails.CSRFProtection(xhr)
			$.get '/docs.json', (data) ->
				$.each data, (k,v) ->
					mockfile = {id: v.id,name: v.company_document_file_name, size: v.company_document_file_size}
					that.emit "addedfile", mockfile
					that.emit "thumbnail", mockfile, v.document_url

		removedfile: (file) ->
			$.ajax
				type: 'POST'
				url: "/docs/#{file.id}"
				data: {'_method': 'delete'}
			if((_ref = file.previewElement) != null)
				_ref.parentNode.removeChild(file.previewElement)
			this._updateMaxFilesReachedClass()