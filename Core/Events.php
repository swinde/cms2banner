<?php


namespace Swinde\Cms2Banner\Core;
use OxidEsales\Eshop\Core\Registry;

class Events
{
    /**
     * Add additional fields: Naehrwertetable
     */
    public static function onActivate()
    {
        if( !self::_swCheckIfDatabaseFieldExists() ) {
            self::swAlterActionsTable();
        }

    }

    public static function swAlterActionsTable ()
    {
        $query = "ALTER TABLE `oxactions` ADD (
                `SWCONTENTID ` varchar(40) NOT NULL COMMENT 'CMS ID'                   
            ) ";

        \OxidEsales\Eshop\Core\DatabaseProvider::getDb()->execute($query);
    }

    public static function clearTmp($sClearFolderPath = '')
    {
        $sFolderPath = self::_getFolderToClear($sClearFolderPath);
        $hDirHandler = opendir($sFolderPath);
        if (!empty($hDirHandler)) {
            while (false !== ($sFileName = readdir($hDirHandler))) {
                $sFilePath = $sFolderPath . DIRECTORY_SEPARATOR . $sFileName;
                self::_clear($sFileName, $sFilePath);
            }
            closedir($hDirHandler);
        }
        return true;
    }

    protected static function _getFolderToClear($sClearFolderPath = '')
    {
        $sTempFolderPath = (string) Registry::getConfig()->getConfigParam('sCompileDir');
        if (!empty($sClearFolderPath) and (strpos($sClearFolderPath, $sTempFolderPath) !== false)) {
            $sFolderPath = $sClearFolderPath;
        } else {
            $sFolderPath = $sTempFolderPath;
        }
        return $sFolderPath;
    }

    protected static function _clear($sFileName, $sFilePath)
    {
        if (!in_array($sFileName, ['.', '..', '.gitkeep', '.htaccess'])) {
            if (is_file($sFilePath)) {
                @unlink($sFilePath);
            } else {
                self::clearTmp($sFilePath);
            }
        }
    }
    protected static function _swCheckIfDatabaseFieldExists()
    {
        $blSwDatabaseFieldExists = false;

        $sTable = 'oxactions';
        $sColumn = 'swcontentid';
        $oDbHandler = oxNew( "oxDbMetaDataHandler" );
        $blSwDatabaseFieldExists = $oDbHandler->tableExists( $sTable ) && $oDbHandler->fieldExists( $sColumn, $sTable );

        return $blSwDatabaseFieldExists;
    }

    public static function onDeactivate()
    {
        self::clearTmp();
    }
}
