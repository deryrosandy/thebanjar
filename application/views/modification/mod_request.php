<div class="row-fluid">
<div class="span12">
	<div id="myTabContent" class="tab-content">
	<table cellpadding="0" cellspacing="0" width="100%" class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Payment Code</th>
				<th>Paid Date</th>
				<th>Modification Paid Date</th>
				<th>Reservation Code</th>
				<th>Reservation Date</th>
				<th>Request By</th>
				<th>Status</th>
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
				<td><?php echo $row_pay->bd_pay_code;?></td>
				<td align="center"><?php echo date('d-m-Y', strtotime($row_pay->bd_pay_date));?></td>
				<td align="center"><?php echo date('d-m-Y', strtotime($row_pay->bd_pay_mod));?></td>
				<td><?php echo $row_pay->bd_res_code;?></td>
				<td align="center"><?php echo date('d-m-Y', strtotime($row_pay->bd_res_date));?></td>
				<td align="center"><?php echo ucfirst($row_pay->bd_req_by);?></td>
				<td align="center"><?php echo ucfirst($row_pay->bd_status);?></td>
				<td align="center">
					<?php 
					if ($row_pay->bd_status == 'wait') {echo anchor('modification/application/approve_mod/'.$row_pay->id_bill_date,'approve');?>  
					<?php echo anchor('modification/application/reject_mod/'.$row_pay->id_bill_date,'reject');}?>
				</td>
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