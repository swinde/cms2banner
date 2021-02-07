
[{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
    [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
    [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]

    [{if $sBannerPictureUrl}]
    <li class="item">
        [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
        [{if $sBannerLink}]
        <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
            [{/if}]
            <img src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">

            [{if $sBannerLink}]
        </a>
        [{/if}]
        [{*oxstyle include=$oViewConf->getModuleUrl('cms2banner', 'out/src/css/cms2banner.css')*}]
        [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
        <p class="flex-caption">
            [{if $sBannerLink}]
            <a href="[{$sBannerLink}]" class="flex-caption-link" title="[{$oBanner->oxactions__oxtitle->value}]">
                [{/if}]
                <span class="title">[{$oArticle->oxarticles__oxtitle->value}]</span>[{if $oArticle->oxarticles__oxshortdesc->value|trim}]<br/><span class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</span>[{/if}]
                [{if $sBannerLink}]
            </a>
            [{/if}]
        </p>
        [{/if}]
        [{*Einbinden einer CMS Seite je Banner *}]
        [{if $oBanner->oxactions__swcontentid->value}]
        <div class="flex-cms2banner" style="background: #000;width: 100%;margin: 0;padding: 10px;position: absolute;left: 0;bottom: 0;color: #fff;">
            [{ oxcontent ident=$oBanner->oxactions__swcontentid->value }]
        </div>
        [{/if}]

    </li>
    [{/if}]
    [{/foreach}]