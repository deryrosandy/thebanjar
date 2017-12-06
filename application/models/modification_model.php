<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Modification_model extends CI_Model {

	/**
	 * PT Gapura Angkasa
	 * Warehouse Management System.
	 * ver 3.0
	 * 
	 * App id : 
	 * App code : wmsdps
	 *
	 * weighing model
	 *
	 * url : http://dom.wms.dps.gapura.co.id/
	 * design : SIGAP Team
	 * project head : mantara@gapura.co.id
	 *
	 * developer : panca dharma wisesa (pandhawa digital)
	 * phone : 0361 853 2400
	 * email : pandhawa.digital@gmail.com
	 *
	 * copyright by panca dharma wisesa (pandhawa digital)
	 * Do not copy, modified, share or sell this script 
	 * without any permission from developer
	 */
	 
	 ## GET DATABASE ##
	 
	 public function get_payment_list($num, $offset)
	 {
		$this->db->where('rb_isvoid', 'no');
		$this->db->where('rb_paid_date != `res_date`');
		$this->db->join('tbb_reservasi', 'rb_res_code = res_code','LEFT');
		$this->db->order_by('id_res_bill', 'DESC');
		$this->db->limit($num, $offset);
		$query = $this->db->get('tbb_reservation_bill');
		
		return $query->result();
	 } 
	 
	 public function get_payment_list_search_date($search, $num, $offset)
	 {
		$this->db->where('(rb_paid_date LIKE "%'.$search.'%" OR `rb_res_code` LIKE "%'.$search.'%")');
		$this->db->where('rb_isvoid', 'no');
		$this->db->where('rb_paid_date != `res_date`');
		$this->db->join('tbb_reservasi', 'rb_res_code = res_code','LEFT');
		$this->db->order_by('id_res_bill', 'DESC');
		$this->db->limit($num, $offset);
		$query = $this->db->get('tbb_reservation_bill');
		
		return $query->result();
	 }
	 
	 public function get_payment_list_search($search, $num, $offset)
	 {
		$query = "SELECT * FROM (`tbb_reservation_bill`) 
				  LEFT JOIN `tbb_reservasi` ON `rb_res_code` = `res_code`
				  WHERE (`rb_pay_code` LIKE '%$search%' OR `rb_res_code` LIKE '%$search%')
				  AND `rb_isvoid` = 'no' 
				  AND `rb_paid_date` != `res_date`
				  ORDER BY `id_res_bill` DESC LIMIT $offset, $num";
		$query = $this->db->query($query);
		
		return $query->result();
	 }
	 
	 public function get_detail_transaction($id_transaction)
	 {
		$this->db->where('id_res_bill', $id_transaction);
		$this->db->where('rb_isvoid', 'no');
		$this->db->join('tbb_reservasi', 'rb_res_code = res_code','LEFT');
		$query = $this->db->get('tbb_reservation_bill');
		
		return $query->row();
	 }  
	 
	 public function get_detail_mod_request($id)
	 {
		$this->db->where('id_bill_date', $id);
		$query = $this->db->get('tbb_bill_date_mod');
		
		return $query->row();
	 } 
	 
	 public function get_mod_request($id_transaction)
	 {
		$this->db->where('bd_id_res_bill', $id_transaction);
		$this->db->where('bd_status != ', 'reject');
		$query = $this->db->get('tbb_bill_date_mod');
		
		return $query->num_rows();
	 } 
	 
	 public function get_request_list()
	 {
		$query = $this->db->get('tbb_bill_date_mod');
		
		return $query->result();
	 }
	 
	## COUNT DATABASE ##
	
	public function count_payment()
	{
		$this->db->where('rb_isvoid !=', 'yes');
		$this->db->where('rb_paid_date != `res_date`');
		$this->db->join('tbb_reservasi', 'rb_res_code = res_code','LEFT');
		$query = $this->db->get('tbb_reservation_bill');
		return $query->num_rows();
	}
	
	public function count_request()
	{
		$query = $this->db->get('tbb_bill_date_mod');
		return $query->num_rows();
	}
	
	public function count_payment_search($search)
	{
		$query = "SELECT * FROM (`tbb_reservation_bill`) 
				  LEFT JOIN `tbb_reservasi` ON `rb_res_code` = `res_code`
				  WHERE (`rb_pay_code` LIKE '%$search%' OR `rb_res_code` LIKE '%$search%')
				  AND `rb_isvoid` = 'no' 
				  AND `rb_paid_date` != `res_date`";
		$query = $this->db->query($query);
		return $query->num_rows();
	}
	
	public function count_payment_search_date($search)
	{
		$this->db->where('(rb_paid_date LIKE "%'.$search.'%" OR `rb_res_code` LIKE "%'.$search.'%")');
		$this->db->where('rb_isvoid !=', 'yes');
		$this->db->where('rb_paid_date != `res_date`');
		$this->db->join('tbb_reservasi', 'rb_res_code = res_code','LEFT');
		$query = $this->db->get('tbb_reservation_bill');
		return $query->num_rows();
	}
	
	
	## INSERT DATABASE ##
	
	public function insert_modification_request($request)
	{
		$this->db->insert('tbb_bill_date_mod', $request);
	}
	
	## UPDATE DATABASE ##
	
	public function approve_mod_request($detail, $username)
	{
		$data = array(
			'rb_paid_date' => $detail->bd_pay_mod,
			'rb_update_by' => 'system (mod request approved by '.$username.')',
		);
		
		$this->db->where('id_res_bill', $detail->bd_id_res_bill);
		$this->db->update('tbb_reservation_bill', $data);
		
		$this->db->where('id_bill_date', $detail->id_bill_date);
		$this->db->update('tbb_bill_date_mod', array('bd_status' => 'approve', 'bd_app_by' => $username));
	}
	
	public function reject_mod_request($id, $username)
	{
		$this->db->where('id_bill_date', $id);
		$this->db->update('tbb_bill_date_mod', array('bd_status' => 'reject', 'bd_app_by' => $username));
	}
	
}
	 