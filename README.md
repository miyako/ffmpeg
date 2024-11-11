# ffmpeg

based on [eugeneware/ffmpeg-static](https://github.com/eugeneware/ffmpeg-static)

example of a synchronous call

```4d
var $in : 4D.File
$in:=Folder(fk desktop folder).file("sample.mov")

var $ffmpeg : cs.FFmpeg
$ffmpeg:=cs.FFmpeg.new()

var $info : Text
$info:=$ffmpeg.start(["-i"; $in]).controller._worker.wait().responseError

ALERT($info)
```

example of an asynchronous call

```4d
#DECLARE($params : Object)

If ($params=Null)
	
	/*
		async calls must be performed in a worker or form
	*/
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	$in:=Folder(fk desktop folder).file("sample.mov")
	$out:=Folder(fk desktop folder).file("sample.mp4")
	
	var $ffmpeg : cs.FFmpeg
	$ffmpeg:=cs.FFmpeg.new(cs._FFmpeg_Controller)
	$ffmpeg.start(["-i"; $in; "-vcodec"; "libx264"; $out])
	
End if 
```
