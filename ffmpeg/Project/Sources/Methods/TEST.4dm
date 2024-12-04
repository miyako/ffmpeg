//%attributes = {}
#DECLARE($params : Object)

If ($params=Null:C1517)
	
/*
async calls must be performed in a worker or form
*/
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	$in:=Folder:C1567(fk desktop folder:K87:19).file("sample.mov")
	$out:=Folder:C1567(fk desktop folder:K87:19).file("sample.mp4")
	
	var $ffmpeg : cs:C1710.FFmpeg
	$ffmpeg:=cs:C1710.FFmpeg.new()
	$ffmpeg.start(["-i"; $in; "-vcodec"; "libx264"; $out])
	
End if 