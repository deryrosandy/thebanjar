<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Application extends My_Reservation {

	/**
	 * The Banjar Bali
	 * Reservation System.
	 * 
	 * App code : app.rsv.alcd
	 * App ver  : 1.0.0
	 *
	 * cashier/payment controller
	 *
	 * design : SIGAP Team
	 * project head : primawinangun@gmail.com
	 *
	 * developer : prima winangun
	 * phone : 0822 844 60840
	 *
	 * copyright by prima winangun
	 * Do not copy, modified, share or sell this script 
	 * without any permission from developer
	 */
	 
	function __construct()
	{
        parent::__construct();
	} 
	
	public function index()
	{
		$this->payment_list();
	}
	
	## ------------ ##
	## PAYMENT LIST ##
	## ------------ ##
	
	public function payment_list()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		# Page Data
		$page['page_title'] = $this->session->userdata('title');
		$page['modul'] = 'modification';
		$page['sidebar_payment_list'] = 'on';
		$page['sidebar'] = $this->sidebar_set($user['log_data']);
		
		# Pagination Config
		$config['base_url'] = base_url().'index.php/modification/application/payment_list/'; //set the base url for pagination
		$config['total_rows'] = $this->modification_model->count_payment(); //total rows
		$config['per_page'] = 10; //the number of per page for pagination
		$config['uri_segment'] = 4; //see from base_url. 3 for this case
		$this->pagination->initialize($config);
		$pagination = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
		
		# Get data Travel
		$data['pay_list'] = $this->modification_model->get_payment_list($config['per_page'], $pagination);
		$data['code'] = '';
		$data['date'] = date('d-m-Y', now());
		
		# Application Log
		$this->app_record($user);
		
		#view call
		$this->view_call('modification/payment_list', $page, $data);
	}
	
	public function payment_list_search()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		# Page Data
		$page['page_title'] = $this->session->userdata('title');
		$page['modul'] = 'modification';
		$page['sidebar_payment_list'] = 'on';
		$page['sidebar'] = $this->sidebar_set($user['log_data']);
		
		# Search Input Post
		if ($this->input->post('pay_code') != NULL)
		{
			$this->session->set_flashdata('search_payment', $this->input->post('pay_code'));
			$search = $this->input->post('pay_code');
		} else { 
			$search = $this->session->flashdata('search_payment');
			$this->session->keep_flashdata('search_payment');
		}
		
		# Pagination Config
		$config['base_url'] = base_url().'index.php/modification/application/payment_list_search/'; //set the base url for pagination
		$config['total_rows'] = $this->modification_model->count_payment_search($search); //total rows
		$config['per_page'] = 10; //the number of per page for pagination
		$config['uri_segment'] = 4; //see from base_url. 3 for this case
		$this->pagination->initialize($config);
		$pagination = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
		
		# Get data Travel
		$data['pay_list'] = $this->modification_model->get_payment_list_search($search, $config['per_page'], $pagination);
		$data['code'] = $search;
		$data['date'] = date('d-m-Y', now());
		
		# Application Log
		$this->app_record($user);
		
		#view call
		$this->view_call('modification/payment_list', $page, $data);
	}
	
	public function payment_list_date_search()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		# Page Data
		$page['page_title'] = $this->session->userdata('title');
		$page['modul'] = 'modification';
		$page['sidebar_payment_list'] = 'on';
		$page['sidebar'] = $this->sidebar_set($user['log_data']);
		
		# Search Input Post
		if ($this->input->post('pay_date') != NULL)
		{
			$this->session->set_flashdata('search_date', date('Y-m-d', strtotime($this->input->post('pay_date'))));
			$search = date('Y-m-d', strtotime($this->input->post('pay_date')));
		} else { 
			$search = $this->session->flashdata('search_date');
			$this->session->keep_flashdata('search_date');
		}
		
		# Pagination Config
		$config['base_url'] = base_url().'index.php/modification/application/payment_list_date_search/'; //set the base url for pagination
		$config['total_rows'] = $this->modification_model->count_payment_search_date($search); //total rows
		$config['per_page'] = 10; //the number of per page for pagination
		$config['uri_segment'] = 4; //see from base_url. 3 for this case
		$this->pagination->initialize($config);
		$pagination = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
		
		# Get data Travel
		$data['pay_list'] = $this->modification_model->get_payment_list_search_date($search, $config['per_page'], $pagination);
		$data['code'] = '';
		$data['date'] = $search;
		
		# Application Log
		$this->app_record($user);
		
		#view call
		$this->view_call('modification/payment_list', $page, $data);
	}
	
	public function modification_request()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		# Get detail transaction
		$transaction = $this->modification_model->get_detail_transaction($this->uri->segment(4));
		$mod_request = $this->modification_model->get_mod_request($this->uri->segment(4));
		if ($mod_request < 1 AND $transaction != NULL)
		{
			$request = array(
						'bd_id_res_bill' => $transaction->id_res_bill,
						'bd_res_code' => $transaction->res_code,
						'bd_res_date' => $transaction->res_date,
						'bd_pay_code' => $transaction->rb_pay_code,
						'bd_pay_date' => $transaction->rb_paid_date,
						'bd_pay_mod' => $transaction->res_date,
						'bd_req_by' => $user['log_data']['username'],
						'bd_update_by' => $user['log_data']['username'],
						);
			
			$this->modification_model->insert_modification_request($request);
			
			# Application Log
			$this->app_record($user);
			
			redirect('modification/application/payment_list/success/');
		} else {
		
			# Application Log
			$this->app_record($user);
			
			redirect('modification/application/payment_list/fail/');
		}
		
	}
	
	## ------------------- ##
	## END OF PAYMENT LIST ##
	## ------------------- ##
	
	## -------------------- ##
	## REQUEST MODIFICATION ##
	## -------------------- ##
	
	public function request_list()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		# Page Data
		$page['page_title'] = $this->session->userdata('title');
		$page['modul'] = 'modification';
		$page['sidebar_request_list'] = 'on';
		$page['sidebar'] = $this->sidebar_set($user['log_data']);
		
		# Pagination Config
		$config['base_url'] = base_url().'index.php/modification/application/request_list/'; //set the base url for pagination
		$config['total_rows'] = $this->modification_model->count_request(); //total rows
		$config['per_page'] = 10; //the number of per page for pagination
		$config['uri_segment'] = 4; //see from base_url. 3 for this case
		$this->pagination->initialize($config);
		$pagination = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
		
		# Get data Travel
		$data['pay_list'] = $this->modification_model->get_request_list($config['per_page'], $pagination);
		$data['code'] = '';
		$data['date'] = date('d-m-Y', now());
		
		# Application Log
		$this->app_record($user);
		
		#view call
		$this->view_call('modification/mod_request', $page, $data);
	}
	
	public function approve_mod()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		
		$detail_request = $this->modification_model->get_detail_mod_request($this->uri->segment(4));
		
		$this->modification_model->approve_mod_request($detail_request, $user['log_data']['username']);
		
		# Application Log
		$this->app_record($user);
		
		redirect('modification/application/request_list');
		
	}
	
	public function reject_mod()
	{
		# Log Data
		$limit = array('report');
		$user = $this->session_limit($limit, 1);
		
		# Load Model connect to database
		$this->load->model('modification_model');
		
		$this->modification_model->reject_mod_request($this->uri->segment(4), $user['log_data']['username']);
		
		# Application Log
		$this->app_record($user);
		
		redirect('modification/application/request_list');
		
	}
	
	## --------------------------- ##
	## END OF REQUEST MODIFICATION ##
	## --------------------------- ##
	
	
	
	
	
}

/* End of file payment.php */
/* Location: ./application/controllers/modification/application.php */