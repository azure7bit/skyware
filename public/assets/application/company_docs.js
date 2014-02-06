(function() {

  $(function() {
    Dropzone.autoDiscover = false;
    return $("#company_docs_dropzone").dropzone({
      url: "/docs",
      paramName: 'company_doc[company_document]',
      addRemoveLinks: true,
      maxFilesize: 0.5,
      dictResponseError: 'Error uploading file!',
      init: function() {
        var that;
        that = this;
        this.on("sending", function(file, xhr) {
          return $.rails.CSRFProtection(xhr);
        });
        return $.get('/docs.json', function(data) {
          return $.each(data, function(k, v) {
            var mockfile;
            mockfile = {
              id: v.id,
              name: v.company_document_file_name,
              size: v.company_document_file_size
            };
            that.emit("addedfile", mockfile);
            return that.emit("thumbnail", mockfile, v.document_url);
          });
        });
      },
      removedfile: function(file) {
        var _ref;
        $.ajax({
          type: 'POST',
          url: "/docs/" + file.id,
          data: {
            '_method': 'delete'
          }
        });
        if ((_ref = file.previewElement) !== null) {
          _ref.parentNode.removeChild(file.previewElement);
        }
        return this._updateMaxFilesReachedClass();
      }
    });
  });

}).call(this);
