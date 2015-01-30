<?php

class UsersController extends ControllerBase
{
    public function indexAction()
    {

    }

    public function loginAction()
    {
        if($this->session->has("user"))
            return $this->response->redirect("users");

        if ($this->request->isPost()) {
            $user = Users::findFirst(
                array(
                    "user_email = :email: AND user_password = :password: AND user_active = 1",
                    "bind" => array('email' => $this->request->getPost('email'), 'password' => $this->request->getPost('password'))
                )
            );

            if ($user == true) {
                $this->registerSession($user);
                return $this->response->redirect();
            } else {
                $this->flash->error("Podałeś złe dane do logowania");
            }
        }
    }

    private function registerSession($user)
    {
        $this->session->set('user', array(
            'user_id' => $user->user_id,
            'user_email' => $user->user_email
        ));
    }

    public function logoutAction()
    {
        if($this->session->destroy())
            return $this->response->redirect("users/login");
    }

    public function registerAction()
    {
        if($this->request->isPost()){

            $user = new Users();

            $user->assign($this->request->getPost());

            $validation = new MyValidation();

            $valid = $validation->validate($user);

            if($valid->count() == 0){
                if ($user->create()) {
                    $this->flash->notice("Please confirm your account.");

                    $mail = new PHPMailer();

                    $mail->SetFrom("no-reply@groundfunding.nl",  "no-reply");
                    $mail->AddAddress($this->request->getPost("user_email"), $this->request->getPost("user_name"));
                    $mail->Subject = "Confirm account";
                    $mail->AltBody = "To view the message, please use an HTML compatible email viewer!";

                    //$body = "<a href='http://groundfunding.localhost/users/confirm/'>Click</a>";

                    $body = "<a href='http://groundfunding.localhost/register/confirm/" . $user->getUserToken() ."'>Click</a>";

                    $mail->MsgHTML($body);

                    if($mail->send()) unset($_POST);

                    return $this->dispatcher->forward(array(
                        'controller' => 'users',
                        'action' => 'login'
                    ));
                } else {
                    $valid = $user->getMessages();
                }
            }

            foreach ($valid as $message)
                $error[$message->getField()] = $message->getMessage();

            $this->view->error = $error;

            $this->flash->error("Please fill all fields");
        }
    }

    public function confirmAction()
    {
        $user = Users::findFirstByUser_token($this->dispatcher->getParam(0));

        if ($user) {
            $user->user_active = 1;
            $user->user_token = NULL;

            if($user->update())
                $this->flash->success('The email was successfully confirmed. Now you can log In');
            else
                $this->flash->error('Something wrong!');
        }

        return $this->dispatcher->forward(array(
            'controller' => 'users',
            'action' => 'login'
        ));
    }
}
