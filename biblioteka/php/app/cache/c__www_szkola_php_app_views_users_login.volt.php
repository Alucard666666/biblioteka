<div class="col-lg-12">
    <h3 class="page-header">Login</h3>
</div>

<div class="col-lg-12"><?php echo $this->getContent(); ?></div>

<div class="col-lg-6">
    <?php echo $this->tag->form(array('login', 'method' => 'post')); ?>
        <div class="form-group">
            <label for="email">Username</label>
            <?php echo $this->tag->textField(array('email', 'size' => '30', 'class' => 'form-control')); ?>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <?php echo $this->tag->textField(array('password', 'size' => '30', 'class' => 'form-control')); ?>
        </div>
        <div class="form-group">
            <?php echo $this->tag->submitButton(array('Login', 'class' => 'btn btn-primary')); ?>
        </div>
    <?php echo $this->tag->endForm(); ?>
</div>