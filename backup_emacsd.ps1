$env:PATH = "C:\Program Files\PeaZip\res\7z;$env:PATH"

$src_folder = "."
$dst_folder = "D:\programs\"
$output_name = ".emacs.d.7z"



7z.exe a -t7z -mx9  $dst_folder/$output_name $src_folder 
