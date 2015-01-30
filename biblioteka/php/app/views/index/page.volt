<div class="row">
    <div class="col-lg-3 text-center" style="padding-right: 0;">
        <div style="background-color: #428bca; padding: 3px; -webkit-border-top-left-radius: 10px; -webkit-border-top-right-radius: 10px;-moz-border-radius-topleft: 10px;-moz-border-radius-topright: 10px; border-top-left-radius: 10px;	border-top-right-radius: 10px;">
            <h5 style="color: #fff;"><strong>{{ linkTo(["#", "INVESTEREN!", "class" : "btn-navigation-top"]) }}</strong></h5>
        </div>
    </div>
    <div class="col-lg-3 text-center" style="padding-left: 5px; padding-right: 5px;">
        <div style="background-color: #428bca; padding: 3px; -webkit-border-top-left-radius: 10px; -webkit-border-top-right-radius: 10px;-moz-border-radius-topleft: 10px;-moz-border-radius-topright: 10px; border-top-left-radius: 10px;	border-top-right-radius: 10px;">
            <h5 style="color: #fff;"><strong>{{ linkTo(["#", "BEREKENEN", "class" : "btn-navigation-top"]) }}</strong></h5>
        </div>
    </div>
    <div class="col-lg-3 text-center" style="padding-left: 0;">
        <div style="background-color: #428bca; padding: 3px; -webkit-border-top-left-radius: 10px; -webkit-border-top-right-radius: 10px;-moz-border-radius-topleft: 10px;-moz-border-radius-topright: 10px; border-top-left-radius: 10px;	border-top-right-radius: 10px;">
            <h5 style="color: #fff;"><strong>{{ linkTo(["news", "NIEUWS", "class" : "btn-navigation-top"]) }}</strong></h5>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        {{ image("http://thehotelchicago.com/wp-content/uploads/2014/04/business-meeting-by-window.jpg", "alt" : "img", "class" : "img-responsive") }}
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary" style="margin-top: 20px;">
            <div class="panel-heading">
                <h3 class="panel-title"><strong>Project informatie</strong></h3>
            </div>
            <div class="panel-body">
                {% if projects.items %}
                    {% for project in projects.items %}

                        {% set percent = 100/2 %}

                        <div class="row">
                            <div class="col-lg-12">
                                <h5 class="text-primary"><strong>{{ project.project_title }}</strong> {{ linkTo(["project-" ~ project.project_link, "Toon details <i class='glyphicon glyphicon-play'></i>", "class":"btn btn-default btn-xs", "style":"margin-left: 10px;"]) }}</h5>
                            </div>
                            <div class="col-lg-3">
                                {{ image("http://duokoop.nl/_objects_photos/2014/11/thumb_480d03feffc954075c88abec4f9ac076.jpg", "class":"img-responsive") }}
                            </div>
                            <div class="col-lg-6">
                                <h5>Risicocategorie: {{ project.project_category }}</h5>
                                <h5><strong>Project is volgeschreven</strong></h5>
                            </div>
                            <div class="col-lg-3 text-right">
                                <h4>{% if elements.differenceDateDays(project.project_valid_until) > 0 %}<span class="label label-primary">{{ elements.differenceDateDays(project.project_valid_until) }} DAGEN OVER{% else %}<span class="label label-danger">Valid until midnight{% endif %}</span></h4>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h5>Doel</h5>
                                        <h5>&euro; {{ project.getTotalAmount() }}</h5>
                                    </div>
                                    <div class="col-lg-6">
                                        <h5>Huiding</h5>
                                        <h5>&euro; {{ project.project_price }}</h5>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12" style="margin-top: 20px;">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="{{ project.getProjectPercent() }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ project.getProjectPercent() }}%">
                                        {{ project.getProjectPercent() }}
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <h5><span class="label label-primary">INVESTER</span> <strong>104</strong> INVESTEERDERS</h5>
                            </div>
                        </div>
                        <hr />
                    {% endfor %}

                    {{ elements.navigation(projects, 'index', 'right') }}

                {% else %}
                    <h3 class="text-center">No Projects</h3>
                {% endif %}

            </div>
        </div>
    </div>
</div>