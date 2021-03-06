<div class="col-lg-12">
    <h3 class="page-header">Login</h3>
</div>

<div class="col-lg-12">{{ content() }}</div>

<div class="col-lg-6">
    {{ form("login", "method" : "post") }}
        <div class="form-group">
            <label for="email">Username</label>
            {{  text_field("email", "size" : "30", "class" : "form-control")}}
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            {{  text_field("password", "size" : "30", "class" : "form-control")}}
        </div>
        <div class="form-group">
            {{ submit_button("Login", "class" : "btn btn-primary") }}
        </div>
    {{ end_form() }}
</div>