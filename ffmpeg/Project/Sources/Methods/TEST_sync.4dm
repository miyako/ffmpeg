//%attributes = {}
var $in : 4D:C1709.File
$in:=Folder:C1567(fk desktop folder:K87:19).file("sample.mov")

var $ffmpeg : cs:C1710.FFmpeg
$ffmpeg:=cs:C1710.FFmpeg.new()

var $info : Text
$info:=$ffmpeg.start(["-i"; $in]).controller._worker.wait().responseError

ALERT:C41($info)