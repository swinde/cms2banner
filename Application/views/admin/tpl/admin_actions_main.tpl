[{$smarty.block.parent}]
<td class="edittext" width="120">
    [{oxmultilang ident="CONTENTID"}]
</td>
<td class="edittext">
    <input type="text" class="editinput" size="32" maxlength="[{$edit->oxactions__swcontentid->fldmax_length}]" name="editval[oxactions__swcontentid]" value="[{$edit->oxactions__swcontentid->value}]" [{$readonly}]>
    [{oxinputhelp ident="HELP_GENERAL_SORT"}]
</td>
