<div class="block span3">
<a href="#page-stats" class="block-heading" data-toggle="collapse"> New Product</a>
<div id="page-stats1" class="block-body collapse in">
	<div id="myTabContent" class="tab-content">
			<?php 
			
			$attributes = array('class'=>'form','id'=>'wizard3');
			echo form_open('setting/admin/insert_product', $attributes);?>
                <fieldset class="step" id="w2first">
                    <h1></h1>
					<div class="formRow">
                        <label>Product Category :</label>
                        <div class="formRight">
						<?php 
						$rc = array();
						$rc[''] = '';
						foreach ($product_cat as $rc_list) :
						{
							$rc[$rc_list['cp_code']] = ($rc_list['cp_name']);
						} endforeach; 
						echo form_dropdown('prod_cat',$rc,'');
						?>
						</div>
                        <div class="clear"></div>
                    </div>
					<div class="formRow">
                        <label>Product Code:</label>
                        <div class="formRight">
						<?php 
						$pc = array(
							'name' => 'prod_code',
							'id'   => 'prod_code',
						);
						echo form_input($pc);?>
						</div>
                        <div class="clear"></div>
                    </div>
					<div class="formRow">
                        <label>Product Name:</label>
                        <div class="formRight">
						<?php 
						$pn = array(
							'name' => 'prod_name',
							'id'   => 'prod_name',
						);
						echo form_input($pn);?>
						</div>
                        <div class="clear"></div>
                    </div>
					<div class="formRow">
                        <label>Product Price:</label>
                        <div class="formRight">
						<?php 
						$pri = array(
							'name' => 'prod_rate',
							'id'   => 'prod_rate',
							'placeholder' => 'Rupiah (IDR)'
						);
						echo form_input($pri);?>
						<?php 
						$pru = array(
							'name' => 'prod_rate_usd',
							'id'   => 'prod_rate_usd',
							'placeholder' => 'Dollar (USD)'
						);
						echo form_input($pru);?>
						</div>
                        <div class="clear"></div>
                    </div>
				</fieldset>
				<div class="btn-toolbar">
					<button class="btn btn-primary"><i class="icon-save"></i> Submit</button>
					<div class="btn-group">
					</div>
				</div>
                <div class="clear"></div>
			</form>
			<div class="data" id="w2"></div>
        </div>
</div>
</div>
<div class="block span9">
	<table cellpadding="0" cellspacing="0" width="100%" class="table table-bordered">
        <tfoot>
			<tr><td colspan=8><div class="pagination"><?php echo $this->pagination->create_links();?></div></td></tr>
		</tfoot>
		<thead>
			<tr>
				<th rowspan="2">No</th>
				<th colspan="3">Product</th>
				<th colspan="2">Rate</th>
				<th rowspan="2">Hide Status</th>
				<th rowspan="2">Action</th>
			</tr>
			<tr>
				<th>Category</th>
				<th>Code</th>
				<th>Name</th>
				<th>IDR</th>
				<th>USD</th>
			</tr>
		</thead>
		<tbody>
		<?php 
		if ($product != NULL)
		{
		$num = 1;
		foreach ($product as $row_rm)
		{ 
			?>
			<tr>
				<td><?php echo $num++ ?></td>
				<td><?php echo $row_rm['prod_kategori'] ?></td>
				<td><?php echo $row_rm['prod_code'] ?></td>
				<td><?php echo $row_rm['prod_name'] ?></td>
				<td align="right"><?php echo $row_rm['prod_rate'] ?></td>
				<td align="right"><?php echo $row_rm['prod_rate_dollar'] ?></td>
				<td align="center"><?php echo $row_rm['prod_hide_status'] ?></td>
				
				<td><center>
				<?php 
					if ($row_rm['prod_hide_status'] == 'no'){
						echo anchor('setting/admin/void_product/'.$row_rm['id_prod'], img(array('src'=>"wp-content/themes/thebanjarbali/rsv/images/control/16/busy.png", 'alt'=>'Hide Product', 'title'=>'Hide Product'))); 
						echo '&nbsp'.anchor('setting/admin/edit_product/'.$row_rm['id_prod'], img(array('src'=>"wp-content/themes/thebanjarbali/rsv/images/control/16/config.png", 'alt'=>'Edit Product', 'title'=>'Edit Product')));
					} else {
						echo anchor('setting/admin/show_product/'.$row_rm['id_prod'], img(array('src'=>"wp-content/themes/thebanjarbali/rsv/images/control/16/plus.png", 'alt'=>'Show Product', 'title'=>'Show Product')));
					}
				?>
				</td>
            </tr><?php } } ?>
        </tbody>
    </table>
</div>
</div>