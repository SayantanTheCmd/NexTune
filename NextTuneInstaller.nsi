;--------------------------------
; NexTune Installer NSIS Script
;--------------------------------

# Modern UI 2
!include "MUI2.nsh"

;--------------------------------
; General
Name "NexTune"
OutFile "NexTune_Setup.exe"
InstallDir "$PROGRAMFILES\NexTune"
InstallDirRegKey HKCU "Software\NexTune" "Install_Dir"
RequestExecutionLevel admin

;--------------------------------
; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "Assets\Docs\privacy.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
; Sections
Section "Install"

    ; Set output path
    SetOutPath "$INSTDIR"

    ; Copy all files and folders recursively from script folder
    File /r "*.*"

    ; Create Desktop shortcut
    CreateShortCut "$DESKTOP\NexTune.lnk" "$INSTDIR\NexTune.exe"

    ; Write install path to registry
    WriteRegStr HKCU "Software\NexTune" "Install_Dir" "$INSTDIR"

SectionEnd

;--------------------------------
; Uninstall Section
Section "Uninstall"

    ; Remove all files/folders
    RMDir /r "$INSTDIR"

    ; Remove desktop shortcut
    Delete "$DESKTOP\NexTune.lnk"

    ; Remove registry key
    DeleteRegKey HKCU "Software\NexTune"

SectionEnd