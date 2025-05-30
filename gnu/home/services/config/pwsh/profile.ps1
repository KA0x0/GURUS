function prompt {
    $red = [char27][31m
    $green = [char27][32m
    $blue = [char27][34m
    $resetColor = [char27][0m

    $currentWorkingDirectory = $PWD.Path.Replace($HOME, "~")
    $host.UI.RawUI.WindowTitle = $currentWorkingDirectory
    $colorUser = if ($IsAdmin) {"$red" else "$green"}
    # TODO : Auto expand aliases on return.
    return "$colorUser@:$blue$currentWorkingDirectory$resetColor>_"
}
