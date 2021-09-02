#!/bin/bash
scriptName="UUP Converter v0.6.4"
UUP_CONVERTER_SCRIPT=1

if [ -f `dirname $0`/convert_ve_plugin ]; then
  . `dirname $0`/convert_ve_plugin
fi

if [ -f `dirname $0`/convert_config_linux ] && [ `uname` == "Linux" ]; then
  . `dirname $0`/convert_config_linux
elif [ -f `dirname $0`/convert_config_macos ] && [ `uname` == "Darwin" ]; then
  . `dirname $0`/convert_config_macos
else
  VIRTUAL_EDITIONS_LIST="CoreSingleLanguage Enterprise EnterpriseN Education \
  EducationN ProfessionalEducation ProfessionalEducationN \
  ProfessionalWorkstation ProfessionalWorkstationN ServerRdsh IoTEnterprise"
fi

editions='analogonecore
andromeda
cloud
cloudn
cloude
clouden
core
corecountryspecific
coren
coresinglelanguage
coresystemserver
education
educationn
enterprise
enterpriseeval
enterpriseg
enterprisegn
enterprisen
enterpriseneval
enterprises
enterpriseseval
enterprisesn
enterprisesneval
holographic
iotenterprise
iotenterprises
iotuap
onecoreupdateos
ppipro
professional
professionalcountryspecific
professionaleducation
professionaleducationn
professionaln
professionalsinglelanguage
professionalworkstation
professionalworkstationn
serverarm64
serverarm64core
serverazurecor
serverazurecorcore
serverazurenano
serverazurenanocore
serverazurestackhcicor
serverazurestackhcicorcore
servercloudstorage
servercloudstoragecore
serverdatacenter
serverdatacenteracor
serverdatacenteracorcore
serverdatacentercor
serverdatacentercorcore
serverdatacentercore
serverdatacentereval
serverdatacenterevalcor
serverdatacenterevalcorcore
serverdatacenterevalcore
serverdatacenternano
serverdatacenternanocore
serverhypercore
serverrdsh
serverrdshcore
serversolution
serversolutioncore
serverstandard
serverstandardacor
serverstandardacorcore
serverstandardcor
serverstandardcorcore
serverstandardcore
serverstandardeval
serverstandardevalcor
serverstandardevalcorcore
serverstandardevalcore
serverstandardnano
serverstandardnanocore
serverstoragestandard
serverstoragestandardcore
serverstoragestandardeval
serverstoragestandardevalcore
serverstorageworkgroup
serverstorageworkgroupcore
serverstorageworkgroupeval
serverstorageworkgroupevalcore
serverturbine
serverturbinecor
serverturbinecorcore
serverturbinecore
serverweb
serverwebcore
starter
startern'

bootSourcesList='sources/alert.gif
sources/api-ms-win-core-apiquery-l1-1-0.dll
sources/api-ms-win-downlevel-advapi32-l1-1-0.dll
sources/api-ms-win-downlevel-advapi32-l1-1-1.dll
sources/api-ms-win-downlevel-advapi32-l2-1-0.dll
sources/api-ms-win-downlevel-advapi32-l2-1-1.dll
sources/api-ms-win-downlevel-advapi32-l3-1-0.dll
sources/api-ms-win-downlevel-advapi32-l4-1-0.dll
sources/api-ms-win-downlevel-kernel32-l1-1-0.dll
sources/api-ms-win-downlevel-kernel32-l2-1-0.dll
sources/api-ms-win-downlevel-ole32-l1-1-0.dll
sources/api-ms-win-downlevel-ole32-l1-1-1.dll
sources/api-ms-win-downlevel-shlwapi-l1-1-0.dll
sources/api-ms-win-downlevel-shlwapi-l1-1-1.dll
sources/api-ms-win-downlevel-user32-l1-1-0.dll
sources/api-ms-win-downlevel-user32-l1-1-1.dll
sources/api-ms-win-downlevel-version-l1-1-0.dll
sources/appcompat.xsl
sources/appcompat_bidi.xsl
sources/appcompat_detailed_bidi_txt.xsl
sources/appcompat_detailed_txt.xsl
sources/appraiser.dll
sources/ARUNIMG.dll
sources/arunres.dll
sources/autorun.dll
sources/bcd.dll
sources/bootsvc.dll
sources/cmisetup.dll
sources/compatctrl.dll
sources/compatprovider.dll
sources/cryptosetup.dll
sources/diager.dll
sources/diagnostic.dll
sources/diagtrack.dll
sources/diagtrackrunner.exe
sources/dism.exe
sources/dismapi.dll
sources/dismcore.dll
sources/dismcoreps.dll
sources/dismprov.dll
sources/ext-ms-win-advapi32-encryptedfile-l1-1-0.dll
sources/folderprovider.dll
sources/hwcompat.dll
sources/hwcompat.txt
sources/hwexclude.txt
sources/idwbinfo.txt
sources/imagelib.dll
sources/imagingprovider.dll
sources/input.dll
sources/lang.ini
sources/locale.nls
sources/logprovider.dll
sources/MediaSetupUIMgr.dll
sources/ndiscompl.dll
sources/nlsbres.dll
sources/ntdsupg.dll
sources/offline.xml
sources/pnpibs.dll
sources/reagent.admx
sources/reagent.dll
sources/reagent.xml
sources/rollback.exe
sources/schema.dat
sources/segoeui.ttf
sources/ServicingCommon.dll
sources/setup.exe
sources/setupcompat.dll
sources/SetupCore.dll
sources/SetupHost.exe
sources/SetupMgr.dll
sources/SetupPlatform.cfg
sources/SetupPlatform.dll
sources/SetupPlatform.exe
sources/SetupPrep.exe
sources/SmiEngine.dll
sources/spflvrnt.dll
sources/spprgrss.dll
sources/spwizeng.dll
sources/spwizimg.dll
sources/spwizres.dll
sources/sqmapi.dll
sources/testplugin.dll
sources/unattend.dll
sources/unbcl.dll
sources/upgloader.dll
sources/upgrade_frmwrk.xml
sources/uxlib.dll
sources/uxlibres.dll
sources/vhdprovider.dll
sources/w32uiimg.dll
sources/w32uires.dll
sources/warning.gif
sources/wdsclient.dll
sources/wdsclientapi.dll
sources/wdscore.dll
sources/wdscsl.dll
sources/wdsimage.dll
sources/wdstptc.dll
sources/wdsutil.dll
sources/wimgapi.dll
sources/wimprovider.dll
sources/win32ui.dll
sources/WinDlp.dll
sources/winsetup.dll
sources/wpx.dll
sources/xmllite.dll
sources/..-.*/appraiser.dll.mui
sources/..-.*/arunres.dll.mui
sources/..-.*/cmisetup.dll.mui
sources/..-.*/compatctrl.dll.mui
sources/..-.*/compatprovider.dll.mui
sources/..-.*/dism.exe.mui
sources/..-.*/dismapi.dll.mui
sources/..-.*/dismcore.dll.mui
sources/..-.*/dismprov.dll.mui
sources/..-.*/folderprovider.dll.mui
sources/..-.*/imagingprovider.dll.mui
sources/..-.*/input.dll.mui
sources/..-.*/logprovider.dll.mui
sources/..-.*/MediaSetupUIMgr.dll.mui
sources/..-.*/nlsbres.dll.mui
sources/..-.*/pnpibs.dll.mui
sources/..-.*/reagent.adml
sources/..-.*/reagent.dll.mui
sources/..-.*/rollback.exe.mui
sources/..-.*/setup.exe.mui
sources/..-.*/setup_help_upgrade_or_custom.rtf
sources/..-.*/setupcompat.dll.mui
sources/..-.*/SetupCore.dll.mui
sources/..-.*/setupplatform.exe.mui
sources/..-.*/SetupPrep.exe.mui
sources/..-.*/smiengine.dll.mui
sources/..-.*/spwizres.dll.mui
sources/..-.*/upgloader.dll.mui
sources/..-.*/uxlibres.dll.mui
sources/..-.*/vhdprovider.dll.mui
sources/..-.*/vofflps.rtf
sources/..-.*/vofflps_server.rtf
sources/..-.*/w32uires.dll.mui
sources/..-.*/wdsclient.dll.mui
sources/..-.*/wdsimage.dll.mui
sources/..-.*/wimgapi.dll.mui
sources/..-.*/wimprovider.dll.mui
sources/..-.*/WinDlp.dll.mui
sources/..-.*/winsetup.dll.mui'

infoColor="\033[1;94m"
errorColor="\033[1;91m"
resetColor="\033[0m"

if [ "$1" == "-?" -o "$1" == "--help" -o "$1" == "-h" ]; then
  echo "Usage:"
  echo "$0 [compression] [uups_directory] [create_virtual_editions]"
  echo ""
  echo -e "${infoColor}compression options:${resetColor}"
  echo "wim - standard compression (default)"
  echo "esd - solid compression"
  echo ""
  echo -e "${infoColor}create_virtual_editions options:${resetColor}"
  echo "0 - do not create virtual editions (default)"
  echo "1 - create virtual edtitions"
  echo ""
  if [ `uname` == "Linux" ]; then
    echo -e "${infoColor}convert_config_linux file${resetColor}"
  elif [ `uname` == "Darwin" ]; then
    echo -e "${infoColor}convert_config_macos file${resetColor}"
  fi
  echo "This file can be used to configure some advanced options of this script."
  echo "It is required to place configuration in the same directory as script."
  echo ""
  echo "Possible configuration options:"
  echo "VIRTUAL_EDITIONS_LIST='space delimited editions sequence'"
  echo ""
  echo -e "${infoColor}List of editions created if you enable virtual edtitions creation:${resetColor}"
  for edition in $VIRTUAL_EDITIONS_LIST; do
    echo "- $edition"
  done
  echo "When VIRTUAL_EDITIONS_LIST is not configured, this list contains all editions."
  exit
fi

if ! which cabextract >/dev/null 2>&1 \
|| ! which wimlib-imagex >/dev/null 2>&1 \
|| ! which chntpw >/dev/null 2>&1 \
|| ! which genisoimage >/dev/null 2>&1 \
&& ! which mkisofs >/dev/null 2>&1; then
  echo "One of required applications is not installed."
  echo "The following applications need to be installed to use this script:"
  echo " - cabextract"
  echo " - wimlib-imagex"
  echo " - chntpw"
  echo " - genisoimage or mkisofs"
  echo ""
  if [ `uname` == "Linux" ]; then
    # Linux
    echo "If you use Debian or Ubuntu you can install these using:"
    echo "sudo apt-get install cabextract wimtools chntpw genisoimage"
  elif [ `uname` == "Darwin" ]; then
    # macOS
    echo "macOS requires Homebrew (https://brew.sh) to install the prerequisite software."
    echo "If you use Homebrew, you can install these using:"
    echo "brew tap sidneys/homebrew"
    echo "brew install cabextract wimlib cdrtools sidneys/homebrew/chntpw"
  fi
  exit 1
fi

if ! [ -z $1 ]; then
  type="$1"
else
  type="wim"
fi

if ! [ "$type" == "wim" -o "$type" == "esd" ]; then
  echo -e "$errorColor""Incorrect compression type.""$resetColor"
  echo "Possible options: wim, esd"
  exit 1
fi

if ! [ -z $2 ]; then
  uupDir="$2"
else
  uupDir="UUPs"
fi

if ! [ -z $3 ]; then
  runVirtualEditions="$3"
else
  runVirtualEditions=0
fi
