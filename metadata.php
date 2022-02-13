<?php
/**
 * This file is part of OXID eShop Community Edition.
 *
 * OXID eShop Community Edition is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eShop Community Edition is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2016
 * @version   OXID eShop CE
 */

$sMetadataVersion = '2.1';
$aModule = [
    'id'            => 'swinde/cms2banner',
    'title'       => array(
        'de' => '.BEES | CMS Seiten in Banner einfügen',
        'en' => '.BEES | CMS Seiten in Banner einfügen',
    ),
    'description'  => array(
        'de' => 'Banner mit Text aus einer CMS Seite verbinden.',
        'en' => 'Combine banners with text from a CMS page.'
    ),
    'thumbnail'   => 'out/src/pictures/picture.png',
    'version'     => '1.2.0',
    'author'      => 'Internetservice | Steffen Winde',
    'url'         => 'https://github.com/swinde/cms2banner',
    'email'       => 'inserv@winde-ganzig.de',
    'events' =>[
        'onActivate'   => '\Swinde\Cms2Banner\Core\Events::onActivate',
        'onDeactivate' => '\Swinde\Cms2Banner\Core\Events::onDeactivate',
    ],
    'blocks'      => [
        [
            'template' => 'actions_main.tpl',
            'block'    => 'admin_actions_main_form',
            'file'     => 'views/admin/tpl/admin_actions_main.tpl',
        ],
		[
			'template' => 'layout/base.tpl',
			'block' 	=>'base_style',
			'file'=>'views/blocks/layout/cms2banner_base_style.tpl'
		],
        [
            'template' => 'widget/promoslider.tpl',
            'block'=>'dd_widget_promoslider_list',
            'file'=>'views/blocks/widget/cms2banner_promoslider.tpl'
        ],
		[
			'theme'=>'moga',
			'template' => 'widget/promoslider.tpl',
			'block'=>'dd_widget_promoslider_list',
			'file'=>'views/blocks/widget/cms2banner_promoslider_moga.tpl'
		]
    ],
];