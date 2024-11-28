![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/ffmpeg)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/ffmpeg/total)

### Licensing

* the source code of this component is licensed under the [MIT license](https://github.com/miyako/ffmpeg/blob/master/LICENSE).
* see [www.ffmpeg.org](https://www.ffmpeg.org/legal.html) for the licensing of **ffmpeg**.

# ffmpeg

based on [eugeneware/ffmpeg-static](https://github.com/eugeneware/ffmpeg-static)

## dependencies.json

 ```json
{
	"dependencies": {
		"ffmpeg": {
			"github": "miyako/ffmpeg",
			"version": "*"
		}
	}
}
```

the macOS executable targets Apple Silicon. you may download a universal binary edition from releases.

---

example of a synchronous call

```4d
var $in : 4D.File
$in:=Folder(fk desktop folder).file("sample.mov")

var $ffmpeg : cs.FFmpeg.FFmpeg
$ffmpeg:=cs.FFmpeg.FFmpeg.new()

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
	
	var $ffmpeg : cs.FFmpeg.FFmpeg
	$ffmpeg:=cs.FFmpeg.FFmpeg.new(cs._FFmpeg_Controller)
	$ffmpeg.start(["-i"; $in; "-vcodec"; "libx264"; $out])
	
End if 
```

## note on notarisation

need to increase size when creating `.dmg`. `ffmpeg` needs `1GB`, `ffprobe` needs `5GB`.

```
hdiutil create -format UDBZ -plist -srcfolder {in} {out} -size {size}
```

else possible "resource is busy" error.

```
hdiutil: create failed - リソースが使用中です
```

