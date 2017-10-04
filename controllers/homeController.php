<?php

class homeController extends Controller
{

	private $user;

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $dados = array();

        $products = new Products();
        $categories = new Categories();

        $currentPage = 1;
        $offset = 0;
        $limit = 3;

        if (!empty($_GET['p']) and is_numeric($_GET['p'])) {
            $currentPage = $_GET['p'];
        }

        $offset = ($currentPage * $limit) - $limit;

        $dados['list'] = $products->getList($offset, $limit);
        $dados['totalItems'] = $products->getTotal();
        $dados['numberOfPages'] = ceil($dados['totalItems']/$limit); // ceil arredonda pra cima
        $dados['currentPage'] = $currentPage;

        $dados['categories'] = $categories->getList();

        $dados['maxslider'] = 1297;

        $this->loadTemplate('home', $dados);
    }

}