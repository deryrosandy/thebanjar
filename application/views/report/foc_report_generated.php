
<div class="span12">
<strong><h2>FOC Report </h2></strong>
<table>
	<tr>
		<td width="40%"><strong>Payment Type</strong></td><td>:</td><td><strong><?php echo $payment?></td>
	</tr>
	<tr>
		<td><strong>Cashier </strong></td><td>:</td><td><strong><?php echo ucfirst($user)?></td>
	</tr>
	<tr>
		<td><strong>Date </strong></td><td>:</td><td><strong><?php echo date('d-m-Y', strtotime($start)).' s/d '.date('d-m-Y', strtotime($end));?></td>
	</tr>
	<tr>
		<td colspan="3"><?php echo anchor('report/generate/foc_pdf/'.$user.'/'.$start.'/'.$end,'Download as PDF');?></td>
	</tr>
</table>

	<div id="myTabContent" class="tab-content">
	<table cellpadding="0" cellspacing="0" width="100%" class="table table-bordered">
		<thead>
			<tr>
				<th rowspan="2">No</th>
				<th rowspan="2">Payment Code</th>
				<th rowspan="2">Reservation Code</th>
				<th rowspan="2">Travel</th>
				<th rowspan="2">Guide</th>
				<th colspan="2">Note</th>
			</tr>
		</thead>
		<tbody>
		<?php 
		if ($pay_list != NULL)
		{
		$num = 1;
		foreach ($pay_list as $row_pay)
		{
			?>
			<tr>
				<td align="center"><?php echo $num++;?></td>
				<td><?php echo $row_pay->rb_pay_code;?></td>
				<td><?php echo $row_pay->res_code;?></td>
				<td><?php echo $row_pay->res_agent;?></td>
				<td><?php echo $row_pay->res_guide;?></td>
				<td><?php echo $row_pay->rb_note;?></td>
			</tr>
		<?php 
		} 
		}
		?>
        </tbody>
		<tfoot>
			<tr>
				<td align="right" colspan="6"></td>
			</tr>
		</tfoot>
    </table>
	</div>
</div>
</div>