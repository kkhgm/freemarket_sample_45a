$(function() {
  $("#droparea").on({
    "dragenter dragover":function(e){
    },
    "drop":function(e){
      var file = e.originalEvent.dataTransfer.files[0];
      var fr1 = new FileReader();
      fr1.onload = function(e) {
        var blob=new Blob([e.target.result],{"type":file.type});
        var fr2 = new FileReader();
        fr2.onload = function(e) {
          var src=e.target.result;
          src=new Uint8Array(src);
          src=String.fromCharCode.apply("",src);
          src=btoa(src);
          src="data:"+file.type+";base64,"+src;
          $("<img>").attr({"src":src,"alt":file.name}).appendTo('#droparea');
        }
        fr2.readAsArrayBuffer(blob);
      }
      fr1.readAsArrayBuffer(file);
      e.preventDefault();
    },
  });
});
