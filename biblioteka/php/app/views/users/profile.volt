{{ partial("parts/profile_menu") }}

{{ form("users/register", "method" : "post", "class" : "form-horizontal") }}
    <div class="col-lg-12">
        <div class="page-header">
            <h3>Edit <span class="text-primary">Profile</span>!</h3>
        </div>
    </div>
    <div class="col-lg-12">
        {{ content() }}
    </div>

    <div class="row">
        <div class="col-lg-6">

            <h4 class="page-header">User data</h4>

            <div class="form-group">
                <label for="tussenvoegsel" class="col-sm-3 control-label">Name</label>
                <div class="col-sm-9{% if error['user_name'] is defined %} has-error{% endif %}">
                    {{ textField(["user_name", "class" : "form-control", "value" : user.user_password]) }}
                    {% if error['user_name'] is defined %}<span class="help-block">{{ error['user_name'] }}</span>{% endif %}
                </div>
            </div>
            <div class="form-group">
                <label for="straat" class="col-sm-3 control-label">Straat en Huisnr.</label>
                <div class="col-sm-6{% if error['user_street'] is defined %} has-error{% endif %}">
                    {{ textField(["user_street", "class" : "form-control"]) }}
                </div>
                <label for="email" class="col-sm-1 control-label">Nr</label>
                <div class="col-sm-2{% if error['user_house'] is defined %} has-error{% endif %}">
                    {{ textField(["user_house", "class" : "form-control"]) }}
                </div>
            </div>
            <div class="form-group">
                <label for="postcode" class="col-sm-3 control-label">Postcode</label>
                <div class="col-sm-3{% if error['user_postcode'] is defined %} has-error{% endif %}">
                    {{ textField(["user_postcode", "class" : "form-control"]) }}
                    {% if error['user_postcode'] is defined %}<span class="help-block">{{ error['user_postcode'] }}</span>{% endif %}
                </div>
                <label for="plaats" class="col-sm-1 control-label">Plaats</label>
                <div class="col-sm-5{% if error['user_city'] is defined %} has-error{% endif %}">
                    {{ textField(["user_city", "class" : "form-control"]) }}
                </div>
            </div>
            <div class="form-group" >
                <label for="telefoonnummer" class="col-sm-3 control-label">Telefoonnummer</label>
                <div class="col-sm-9{% if error['user_phone'] is defined %} has-error{% endif %}">
                    {{ textField(["user_phone", "class" : "form-control"]) }}
                    {% if error['user_phone'] is defined %}<span class="help-block">{{ error['user_phone'] }}</span>{% endif %}
                </div>
            </div>
        </div>

        <div class="col-lg-6">

            <h4 class="page-header">Login data</h4>

            <div class="form-group">
                <label for="email" class="col-sm-3 control-label">Email</label>
                <div class="col-sm-9{% if error['user_email'] is defined %} has-error{% endif %}">
                    {{ textField(["user_email", "class" : "form-control", "disabled" : "disabled"]) }}
                    {% if error['user_email'] is defined %}<span class="help-block">{{ error['user_email'] }}</span>{% endif %}
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="col-sm-3 control-label">Password</label>
                <div class="col-sm-9{% if error['user_password'] is defined %} has-error{% endif %}">
                    {{ passwordField(["user_password", "class" : "form-control"]) }}
                    {% if error['user_password'] is defined %}<span class="help-block">{{ error['user_password'] }}</span>{% endif %}
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="col-sm-3 control-label">Confirm password</label>
                <div class="col-sm-9{% if error['confirm_password'] is defined %} has-error{% endif %}">
                    {{ passwordField(["confirm_password", "class" : "form-control"]) }}
                    {% if error['confirm_password'] is defined %}<span class="help-block">{{ error['confirm_password'] }}</span>{% endif %}
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
        <div class="form-group">
            {{ submit_button("Save", "class":"btn btn-primary btn-block") }}
        </div>
    </div>
{{ end_form() }}