[{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
	[{assign var="oArticle" value=$oBanner->getBannerArticle()}]
	[{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
	[{if $sBannerPictureUrl}]
	<div class="carousel-item[{if $smarty.foreach.promoslider.first}] active[{/if}]">
		[{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
		[{if $sBannerLink}]
		<a class="d-block" href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
			[{/if}]
			[{if $oViewConf->isModuleActive('cnc/imagebutler')}]
			<picture>
				<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 200, 'webp')}]" media="(max-width: 375px)">

				<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 750, 300, 'webp')}]" media="(max-width: 767px)">
				<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 750, 300, 'jpg')}]" media="(max-width: 767px)">

				<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 970, 370, 'webp')}]" media="(max-width: 991px)">
				<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 970, 370, 'jpg')}]" media="(max-width: 991px)">

				<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1170, 400, 'webp')}]" media="(max-width: 1199px)">
				<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1170, 400, 'jpg')}]" media="(max-width: 1199px)">

				[{if $promosliderWidth == 'w100c100'}]
			<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'webp')}]" media="(max-width: 1399px)">
			<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'jpg')}]" media="(max-width: 1399px)">

			<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1600, 500, 'webp')}]" media="(max-width: 1599px)">
			<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1600, 500, 'jpg')}]" media="(max-width: 1599px)">

			<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1800, 600, 'webp')}]" media="(min-width: 1600px)">
			<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1800, 600, 'jpg')}]" media="(min-width: 1600px)">
				[{else}]
			<source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'webp')}]" media="(min-width: 1200px)">
			<source srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'jpg')}]" media="(min-width: 1200px)">
				[{/if}]
				<img loading="lazy" src="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 200, 'jpg')}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="w-100">
			</picture>
			[{else}]
		<img loading="lazy" src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="w-100">
			[{/if}]

			[{if $sBannerLink}]
		</a>
		[{/if}]
		[{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
		[{if $sBannerLink}]
		<a href="[{$sBannerLink}]" class="d-block" title="[{$oBanner->oxactions__oxtitle->value}]">
		[{/if}]
		<div class="carousel-caption d-none d-md-block">

			<h5 class="title h2">[{$oArticle->oxarticles__oxtitle->value}]</h5>
			[{if $oArticle->oxarticles__oxshortdesc->value|trim}]
			<p class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</p>
			[{/if}]

		</div>
		[{if $sBannerLink}]
		</a>
		[{/if}]
		[{/if}]
		[{*Einbinden einer CMS Seite je Banner *}]
		[{if $oBanner->oxactions__swcontentid->value}]
		<div class="flex-cms2banner">
			[{ oxcontent ident=$oBanner->oxactions__swcontentid->value }]
		</div>
		[{/if}]
	</div>
	[{/if}]
	[{/foreach}]