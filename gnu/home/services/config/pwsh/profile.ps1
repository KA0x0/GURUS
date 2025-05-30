function prompt {
    $currentWorkingDirectory = $PWD.Path.Replace($HOME, "~")
    $host.UI.RawUI.WindowTitle = $currentWorkingDirectory
    $checkPrivs = if ($IsAdmin) {">_ " else "> "}
    # TODO : Auto expand aliases on return.
    return "$user@$currentWorkingDirectory$checkPrivs "
}
