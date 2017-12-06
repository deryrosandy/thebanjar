<?php if($this->uri->segment(4) == 'success') { ?>
	<div class="alert alert-success"><strong>Request Success, Waiting for approvement</strong></div>
<?php } ?>
<?php if($this->uri->segment(4) == 'fail') { ?>
	<div class="alert alert-error"><strong>Request Fail, It can be due to pending request</strong></div>
<?php } ?>
<div class="block span3">
    
	<?php 	
	echo '<a href="#page-stats" class="block-heading" data-toggle="collapse"> Search Reservation By Code </a>
				  <div id="page-stats" class="block-body collapse in">';
			$attributes = array('class'=>'form','id'=>'wizard3');
			echo form_open('modification/application/payment_list_search', $attributes);?>
	
	<div id="myTabContent" class="tab-content">
		<div class="formRow">
			<label>Payment / Reservation Code :</label>
			<?php 
			$rc = array(
				'name' => 'pay_code',
				'id'   => 'pay_code',
				'class'=> 'span9',
				'value'=> $code
				);
			echo form_input($rc);?>
			<button class="btn btn-primary" style="margin-bottom:10px"><i class="icon-search"></i></button>
		</div>
		</form>
	</div>
</div>
</div>
<div class="block span3">
    
	<?php 	
	echo '<a href="#page-stats" class="block-heading" data-toggle="collapse"> Search Payment By Date</a>
				  <div id="page-stats" class="block-body collapse in">';
			$attributes = array('class'=>'form','id'=>'wizard3');
			echo form_open('modification/application/payment_list_date_search', $attributes);?>
	
	<div id="myTabContent" class="tab-content">
		<div class="formRow">
			<label>Payment Date :</label>
			<?php 
			$rc = array(
				'name' => 'pay_date',
				'id'   => 'datepicker',
				'class'=> 'span9',
				'value'=> $date
				);
			echo form_input($rc);?>
			<button class="btn btn-primary" style="margin-bottom:10px"><i class="icon-search"></i></button>
		</div>
		</form>
	</div>
</div>
</div>
</div>

<div class="row-fluid">
<div class="span12">
	<div id="myTabContent" class="tab-content">
	<table cellpadding="0" cellspacing="0" width="100%" class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Payment Code</th>
				<th>Paid Date</th>
				<th>Reservation Code</th>
				<th>Reservation Date</th>
				<th>Transaction By</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		<?php 
		if ($pay_list != NULL)
		{
		$num = $this->uri->segment(4,0) + 1;
		foreach ($pay_list as $row_pay)
		{ 
			?>
			<tr>
				<td align="center"><?php echo $num++;?></td>
				<td><?php echo $row_pay->rb_pay_code;?></td>
				<td align="center"><?php echo date('d-m-Y', strtotime($row_pay->rb_paid_date));?></td>
				<td><?php echo $row_pay->rb_res_code;?></td>
				<td align="center"><?php echo date('d-m-Y', strtotime($row_pay->res_date));?></td>
				<td align="center"><?php echo ucfirst($row_pay->rb_transaction_by);?></td>
				<td align="center"><?php echo anchor('modification/application/modification_request/'.$row_pay->id_res_bill,'request');?></td>
			</tr>
		<?php } }?>
        </tbody>
		<tfoot>
			<tr><td colspan="14"><div class="pagination"><?php echo $this->pagination->create_links();?></div></td></tr>
		</tfoot>
    </table>
	</div>
</div>
</div>