
<div class="span12">
<strong><h2>Payment Report </h2></strong>
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
		<td colspan="3"><?php echo anchor('report/generate/payment_pdf/'.$payment.'/'.$user.'/'.$start.'/'.$end,'Download as PDF');?></td>
	</tr>
</table>

	<div id="myTabContent" class="tab-content">
	<table cellpadding="0" cellspacing="0" width="100%" class="table table-bordered">
		<thead>
			<tr>
				<th rowspan="2" style="vertical-align:middle">No</th>
				<th rowspan="2" style="vertical-align:middle">Payment Code</th>
				<th rowspan="2" style="vertical-align:middle">Rate</th>
				<th colspan="2">Cash</th>
				<th colspan="2">Fisik Cash</th>
			</tr>
			<tr>
				<th>IDR</th>
				<th>USD</th>
				<th>IDR</th>
				<th>USD</th>
			</tr>
		</thead>
		<tbody>
		<?php 
		$tot_cash_idr = 0;
		$tot_cash_usd = 0;
		$tot_fisik_idr = 0;
		$tot_fisik_usd = 0;
		if ($pay_list != NULL)
		{
		$num = 1;
		foreach ($pay_list as $row_pay)
		{
			$cash_idr = 0;
			$cash_usd = 0;
			$phys_idr = 0;
			$phys_usd = 0;
			$cash_idr = $row_pay->rb_paid_idr;   
			$cash_usd = $row_pay->rb_paid_usd;
			$phys_idr = $row_pay->rb_phys_idr;   
			$phys_usd = $row_pay->rb_phys_usd;
			
			$tot_cash_idr = $tot_cash_idr + $cash_idr;
			$tot_cash_usd = $tot_cash_usd + $cash_usd;
			$tot_phys_idr = $tot_phys_idr + $phys_idr;
			$tot_phys_usd = $tot_phys_usd + $phys_usd;
			
			?>
			<tr>
				<td align="center"><?php echo $num++;?></td>
				<td><?php echo $row_pay->rb_pay_code;?></td>
				<td><?php echo number_format($row_pay->rb_rate, 0, ',', '.');?></td>
				<td align="right"><?php echo number_format($cash_idr, 2, ',', '.');?></td>
				<td align="right"><?php echo number_format($cash_usd, 3, ',', '.');?></td>
				<td align="right"><?php echo number_format($phys_idr, 2, ',', '.');?></td>
				<td align="right"><?php echo number_format($phys_usd, 3, ',', '.');?></td>
			</tr>
		<?php } }?>
        </tbody>
		<tfoot>
			<tr>
				<td align="right" colspan="3">TOTAL</td>
				<td align="right"><?php echo number_format($tot_cash_idr, 2, ',', '.');?></td>
				<td align="right"><?php echo number_format($tot_cash_usd, 3, ',', '.');?></td>
				<td align="right"><?php echo number_format($tot_phys_idr, 2, ',', '.');?></td>
				<td align="right"><?php echo number_format($tot_phys_usd, 3, ',', '.');?></td>
			</tr>
		</tfoot>
    </table>
	</div>
</div>
</div>