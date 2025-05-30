# TODO : Auto expand aliases on return.

$currentDirectory = $PWD.Path.Replace($HOME, "~")
$host.UI.RawUI.WindowTitle = $currentDirectory
$promptChar = if ($IsAdmin) {">_ " else "> "}