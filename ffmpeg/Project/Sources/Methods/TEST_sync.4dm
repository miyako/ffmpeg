//%attributes = {}
var $in : 4D:C1709.File
$in:=Folder:C1567(fk desktop folder:K87:19).file("sample.mov")

var $ffmpeg : cs:C1710.FFmpeg
$ffmpeg:=cs:C1710.FFmpeg.new()

var $info : Text
$info:=$ffmpeg.start(["-i"; $in]).worker.wait().error

ALERT:C41($info)