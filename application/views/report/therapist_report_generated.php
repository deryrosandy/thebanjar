
<div class="span12">
<strong><h2>Therapist Report </h2></strong>
<table>
	<tr>
		<td width="40%"><strong>Therapist Code</strong></td><td>:</td><td><strong><?php echo $user?></td>
	</tr>
	<tr>
		<td><strong>Date </strong></td><td>:</td><td><strong><?php echo date('d-m-Y', strtotime($start)).' s/d '.date('d-m-Y', strtotime($end));?></td>
	</tr>
	<tr>
		<td colspan="3"><?php echo anchor('report/generate/therapist_pdf/'.$user.'/'.$start.'/'.$end,'Download as PDF');?></td>
	</tr>
</table>

	<div id="myTabContent" class="tab-content">
	<table cellpadding="0" cellspacing="0" class="table table-bordered">
		<thead>
			<tr>
				<th>No</th>
				<th>Therapist</th>
				<th>Date</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>
		<?php 
		$sum = 0;
		if ($therapist_list != NULL)
		{
		$num = 1;
		foreach ($therapist_list as $row_thr)
		{
			$sum = $sum + $row_thr->times;
			?>
			<tr>
				<td align="center"><?php echo $num++;?></td>
				<td><?php echo $row_thr->thr_name;?></td>
				<td align="center"><?php echo date('d-M-Y', strtotime($row_thr->thw_date));?></td>
				<td align="center"><?php echo $row_thr->times;?></td>
			</tr>
		<?php } }?>
			<tr>
				<td colspan="3" align="right">Jumlah</td>
				<td align="center"><?php echo $sum; ?></td>
			</tr>
        </tbody>
    </table>
	</div>
</div>
</div>