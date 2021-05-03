<?php 
// API HEADER SET
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');

require __DIR__.'/../bootstrap/app.php';
require __DIR__.'/../model/category.php';

use Slim\Http\Request;
use Slim\Http\Response;
use ReallySimpleJWT\Token;

// TOKEN REQUEST
$app->post('/api/request', function (Request $request, Response $response) {
    $user = $request->getParam('user');
    $secret = 'sec!ReT423*&';
    $expiration = time() + 3600;
    $issuer = 'localhost';
    $token = Token::create($user, $secret, $expiration, $issuer);
    
    if($token && $user == 'guest'){
        return $response->withJson(['status' => true, 'token' => $token]);
    }else{
        return $response->withJson(['status' => false])->withStatus(302);
    }
});


// MIDDLEWARE AUTH
$app->add(function(Request $request, Response $response, $next) {
    $uri = $request->getUri()->getPath();
   
    $auth = $request->getHeader('Authorization');
    $authCheck = false;
    if(!empty($auth[0])){
        $secret = 'sec!ReT423*&';
        $result = Token::validate($auth[0], $secret);
        if($result)
            $authCheck = true;
    }
    if(!$authCheck  && $uri != '/api/request'){
        return $response->withJson(['status' => false, 'msg' => 'Invalid Request']);
    }
    
    $newResponse = $next($request, $response);
    return $newResponse;
});


$app->get('/api/category', function (Request $request, Response $response) {
    $categories = Category::where('parent_id', 0)->with('child')->get();
    return $response->withJson(['status' => true, 'data' => $categories]);
});

$app->get('/api/category/{id}', function (Request $request, Response $response, $args) {
    $categories = Category::where('parent_id', $args['id'])->get();
    return $response->withJson(['status' => true, 'data' => $categories]);
});


$app->run();