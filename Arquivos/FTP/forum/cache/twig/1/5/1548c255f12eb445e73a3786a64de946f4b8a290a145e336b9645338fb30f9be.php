<?php

/* overall_footer.html */
class __TwigTemplate_1548c255f12eb445e73a3786a64de946f4b8a290a145e336b9645338fb30f9be extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        // line 2
        echo "
\t</div> <!-- page-body id in header -->
  </div> <!-- content-forum in header -->
 </div> <!-- container in header -->

";
        // line 7
        // line 8
        echo "
";
        // line 9
        if ((( !(isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null) &&  !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null)) && ((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "index"))) {
            // line 10
            echo "    ";
            $location = "addons/sitesplat_login_body.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("addons/sitesplat_login_body.html", "overall_footer.html", 10)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 12
        echo "
\t<section class=\"section-page\">
        <div id=\"rtblock\" class=\"container\">
            ";
        // line 15
        if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "fltl", array()))) {
        } else {
            $location = "addons/recent_topics_body.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("addons/recent_topics_body.html", "overall_footer.html", 15)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 16
        echo "        </div>
    </section>

";
        // line 19
        echo "\t
  ";
        // line 20
        if ((isset($context["FLATBOOTS_MINI_CMS_ENABLED"]) ? $context["FLATBOOTS_MINI_CMS_ENABLED"] : null)) {
            // line 21
            echo "     ";
            // line 22
            echo "  ";
        } else {
            echo " 
\t";
            // line 23
            $location = "addons/call_to_action_body.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("addons/call_to_action_body.html", "overall_footer.html", 23)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 24
            echo "  ";
        }
        // line 25
        echo "  
\t
\t";
        // line 27
        if ((isset($context["FLATBOOTS_MINI_CMS_ENABLED"]) ? $context["FLATBOOTS_MINI_CMS_ENABLED"] : null)) {
            // line 28
            echo "\t\t";
            // line 29
            echo "\t";
        } else {
            // line 30
            echo "    <section class=\"section-pre-footer\">
\t\t<div class=\"container center\">
\t\t\t<div class=\"row\">
\t\t\t\t<div class=\"col-sm-5 twitter\">
\t\t\t\t\t<div class=\"thumb\"><i class=\"fa fa-paw\"></i></div>
\t\t\t\t\t<div class=\"text\">
\t\t\t\t\t\t<h3>";
            // line 36
            echo $this->env->getExtension('phpbb')->lang("FLATBOOTS_ABOUT_TITLE");
            echo "</h3>
\t\t\t\t\t\t<p>";
            // line 37
            echo $this->env->getExtension('phpbb')->lang("FLATBOOTS_ABOUT_PART_ONE");
            echo "</p>
\t\t\t\t\t\t<a href=\"#\"><strong>";
            // line 38
            echo $this->env->getExtension('phpbb')->lang("READ_MORE");
            echo "</strong></a>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t\t<div class=\"col-sm-5 col-sm-offset-2 twitter\">
\t\t\t\t\t<div class=\"thumb\"><i class=\"fa fa-twitter\"></i></div>
\t\t\t\t\t<div class=\"text\">
\t\t\t\t\t\t<h3><a href=\"https://twitter.com/SiteSplat\">";
            // line 44
            echo $this->env->getExtension('phpbb')->lang("JOIN_US_TWITTER");
            echo "&nbsp;<small>@SiteSplat</small></a></h3>
\t\t\t\t\t\t <div id=\"twitter-feed\"></div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t</div>
\t\t</div>
\t\t <div class=\"section-bg\"></div>
\t</section>
\t";
        }
        // line 53
        echo "    
\t<footer class=\"burned-asphalt\"> <!-- Footer block -->
\t\t<div class=\"midnight-\" id=\"sub-footer\">
\t\t\t<div class=\"container\">
\t\t\t\t<div class=\"row bottomLinks\">
\t\t\t\t
\t\t\t\t\t<div class=\"col-sm-6 sm-direction\">
\t\t\t\t\t <nav>
\t\t\t\t\t";
        // line 61
        if ((isset($context["FLATBOOTS_MINI_CMS_ENABLED"]) ? $context["FLATBOOTS_MINI_CMS_ENABLED"] : null)) {
            // line 62
            echo "\t\t\t\t\t\t";
            // line 63
            echo "\t\t\t\t\t";
        } else {
            // line 64
            echo "\t\t\t\t\t\t<ul class=\"list-inline footer-nav\">
\t\t\t\t\t\t <li><a href=\"http://goo.gl/LvmwlF\" title=\"\">";
            // line 65
            echo $this->env->getExtension('phpbb')->lang("ADVERTISE");
            echo "</a></li>
\t\t\t\t\t\t <li><a href=\"";
            // line 66
            echo (isset($context["U_PRIVACY"]) ? $context["U_PRIVACY"] : null);
            echo "\" title=\"\">";
            echo $this->env->getExtension('phpbb')->lang("PRIVACY");
            echo "</a></li>
\t\t\t\t\t\t <li><a href=\"";
            // line 67
            echo (isset($context["U_DMCA"]) ? $context["U_DMCA"] : null);
            echo "\" title=\"\">";
            echo $this->env->getExtension('phpbb')->lang("DMCA");
            echo "</a></li>
\t\t\t\t\t\t <li><a href=\"";
            // line 68
            echo (isset($context["U_TERMS_USE"]) ? $context["U_TERMS_USE"] : null);
            echo "\" title=\"\">";
            echo $this->env->getExtension('phpbb')->lang("TERMS");
            echo "</a></li>
\t\t\t\t\t\t ";
            // line 69
            // line 70
            echo "\t\t\t\t\t\t ";
            if ((isset($context["U_CONTACT_US"]) ? $context["U_CONTACT_US"] : null)) {
                // line 71
                echo "\t\t\t\t\t\t <li><a href=\"";
                echo (isset($context["U_CONTACT_US"]) ? $context["U_CONTACT_US"] : null);
                echo "\" title=\"\">";
                echo $this->env->getExtension('phpbb')->lang("CONTACT_US");
                echo "</a></li>
\t\t\t\t\t\t ";
            }
            // line 73
            echo "\t\t\t\t\t\t ";
            // line 74
            echo "\t\t\t\t\t\t</ul>
\t\t\t\t\t";
        }
        // line 75
        echo "\t
\t\t\t\t\t </nav>
\t\t\t\t\t</div>
\t\t\t\t\t\t
\t\t\t\t\t<div class=\"col-sm-6 sm-direction\">\t
\t\t\t\t\t\t<div class=\"clearfix socialbar\">
\t\t\t\t\t\t";
        // line 81
        if ((isset($context["FLATBOOTS_MINI_CMS_ENABLED"]) ? $context["FLATBOOTS_MINI_CMS_ENABLED"] : null)) {
            // line 82
            echo "\t\t\t\t\t\t\t\t";
            // line 83
            echo "\t\t\t\t\t\t";
        } else {
            // line 84
            echo "\t\t\t\t\t\t\t<div class=\"social-network\">
\t\t\t\t\t\t\t\t<a class=\"google-plus-color\" title=\"Google+\" href=\"https://plus.google.com/u/0/100435978342273345264/\"><i class=\"fa fa-google-plus\"></i></a>
\t\t\t\t\t\t\t\t<a class=\"github-color\" title=\"Github\" href=\"#2\"><i class=\"fa fa-github\"></i></a>
\t\t\t\t\t\t\t\t<a class=\"behance-color\" title=\"Behance\" href=\"#3\"><i class=\"fa fa-behance\"></i></a>
\t\t\t\t\t\t\t\t<!-- <a class=\"dropbox-color\" title=\"Dropbox\" href=\"#4\"><i class=\"fa fa-dropbox\"></i></a> -->
\t\t\t\t\t\t\t\t<!-- <a class=\"pinterest-color\" title=\"Pinterest\" href=\"#5\"><i class=\"fa fa-pinterest\"></i></a> -->
\t\t\t\t\t\t\t\t<a class=\"facebook-color\" title=\"Facebook\" href=\"#6\"><i class=\"fa fa-facebook\"></i></a>
\t\t\t\t\t\t\t\t<a class=\"twitter-color\" title=\"Twitter\" href=\"https://twitter.com/SiteSplat\"><i class=\"fa fa-twitter\"></i></a>
\t\t\t\t\t\t\t\t<!-- <a class=\"bitbucket-color\" title=\"Bitbucket\" href=\"#8\"><i class=\"fa fa-bitbucket\"></i></a> -->
\t\t\t\t\t\t\t\t<a class=\"envato-color\" title=\"Envato\" href=\"http://themeforest.net/user/ThemeSplat/portfolio?ref=ThemeSplat\"><i class=\"icon-moon-envatoleaf\"></i></a>
\t\t\t\t\t\t\t\t<a class=\"rss-color hidden-xs\" title=\"rss\" href=\"";
            // line 94
            echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
            echo "\"><i class=\"fa fa-rss\"></i></a>
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t";
        }
        // line 96
        echo "\t
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>\t
\t\t\t\t\t
\t\t\t\t\t<div class=\"col-sm-6 sm-direction\">
\t\t\t\t\t <p class=\"copyrights\">
\t\t\t\t\t  ";
        // line 102
        // line 103
        echo "\t\t\t\t\t  <small>";
        echo $this->env->getExtension('phpbb')->lang("HANDCRAFTED");
        echo "</small>&nbsp;<i class=\"fa fa-heart text-flatboots-red\"></i>&nbsp;<small>";
        echo $this->env->getExtension('phpbb')->lang("AND");
        echo "</small>&nbsp;<i class=\"fa fa-coffee\"></i>&nbsp;<small>";
        echo $this->env->getExtension('phpbb')->lang("BY");
        echo "<a href=\"http://www.sitesplat.com/\" title=\"SiteSplat.com\" target=\"_blank\">&nbsp;";
        echo $this->env->getExtension('phpbb')->lang("SITESPLAT");
        echo "</a></small>
\t\t\t\t\t  ";
        // line 104
        // line 105
        echo "\t\t\t\t\t </p>
\t\t\t\t\t</div>
\t\t\t\t\t
\t\t\t\t\t<div class=\"col-sm-6 sm-direction\">
\t\t\t\t\t  <p class=\"debug-output\">
\t\t\t\t\t  ";
        // line 110
        // line 111
        echo "\t\t\t\t\t\t<small>&#45;&nbsp;";
        echo (isset($context["S_TIMEZONE"]) ? $context["S_TIMEZONE"] : null);
        echo "&nbsp;&#45;</small>
\t\t\t\t\t  ";
        // line 112
        // line 113
        echo "\t\t\t\t\t\t";
        if ((isset($context["DEBUG_OUTPUT"]) ? $context["DEBUG_OUTPUT"] : null)) {
            echo " <small>";
            echo (isset($context["DEBUG_OUTPUT"]) ? $context["DEBUG_OUTPUT"] : null);
            echo "</small>";
        }
        // line 114
        echo "\t\t\t\t\t\t<!-- ";
        echo $this->env->getExtension('phpbb')->lang("FLATBOOTS_VERSION");
        echo " -->
\t\t\t\t\t  </p>
\t\t\t\t\t</div>
\t\t\t\t\t
\t\t\t\t</div>
\t\t\t</div>
\t\t</div>
\t</footer>

<a id=\"totop\" class=\"top-flat\" href=\"\" onclick=\"return false;\" style=\"display:none;\"></a>

<div class=\"hidden\">";
        // line 125
        if ( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null)) {
            echo (isset($context["RUN_CRON_TASK"]) ? $context["RUN_CRON_TASK"] : null);
        }
        echo "</div> 

<!-- injected via core and ajax JS for the return confirmation actions -->
   <div id=\"page-footer\">
\t<div id=\"darkenwrapper\" data-ajax-error-title=\"";
        // line 129
        echo $this->env->getExtension('phpbb')->lang("AJAX_ERROR_TITLE");
        echo "\" data-ajax-error-text=\"";
        echo $this->env->getExtension('phpbb')->lang("AJAX_ERROR_TEXT");
        echo "\" data-ajax-error-text-abort=\"";
        echo $this->env->getExtension('phpbb')->lang("AJAX_ERROR_TEXT_ABORT");
        echo "\" data-ajax-error-text-timeout=\"";
        echo $this->env->getExtension('phpbb')->lang("AJAX_ERROR_TEXT_TIMEOUT");
        echo "\" data-ajax-error-text-parsererror=\"";
        echo $this->env->getExtension('phpbb')->lang("AJAX_ERROR_TEXT_PARSERERROR");
        echo "\">
\t\t<div id=\"darken\">&nbsp;</div>
\t</div>

\t<div id=\"phpbb_alert\" class=\"alert alert-default phpbb_alert\" data-l-err=\"";
        // line 133
        echo $this->env->getExtension('phpbb')->lang("ERROR");
        echo "\" data-l-timeout-processing-req=\"";
        echo $this->env->getExtension('phpbb')->lang("TIMEOUT_PROCESSING_REQ");
        echo "\">
\t\t<button type=\"button\" class=\"close alert_close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t<h3 class=\"alert_title\">&nbsp;</h3>
\t\t <p class=\"alert_text\"></p>
\t</div>
\t
\t<div id=\"phpbb_confirm\" class=\"alert alert-default phpbb_alert\">
\t\t<button type=\"button\" class=\"close alert_close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t<div class=\"alert_text\"></div>
\t</div>
  </div>\t
<!-- injected via core and ajax JS for the return confirmation actions -->

";
        // line 146
        if (((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null) && (((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "viewforum") || ((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "viewtopic")))) {
            // line 147
            echo "\t<div class=\"modal fade\" id=\"BreadcrumbMap\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"BreadcrumbsLabel\">
\t  <div class=\"modal-dialog\" role=\"document\">
\t\t<div class=\"modal-content\">
\t\t  <div class=\"modal-header\">
\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span class=\"awe-remove-circle\"></span></button>
\t\t\t<h4 class=\"modal-title\" id=\"BreadcrumbsLabel\">";
            // line 152
            echo $this->env->getExtension('phpbb')->lang("NAVIGATION");
            echo "</h4>
\t\t  </div>
\t\t  <div class=\"modal-body file-tree\">
\t\t   <ul>
\t\t\t<li class=\"root\"><a href=\"";
            // line 156
            echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("INDEX");
            echo "</a></li>
\t\t\t";
            // line 157
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "navlinks", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["navlinks"]) {
                // line 158
                echo "\t\t\t   <li><a href=\"";
                echo $this->getAttribute($context["navlinks"], "U_VIEW_FORUM", array());
                echo "\">";
                echo $this->getAttribute($context["navlinks"], "FORUM_NAME", array());
                echo "</a></li>
\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['navlinks'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 160
            echo "\t\t   </ul>
\t\t    <i class=\"icon-compass fa fa-compass\"></i>
\t\t  </div>
\t\t  <div class=\"modal-footer\">
\t\t  </div>
\t\t</div>
\t  </div>
\t</div>
\t";
        }
        // line 169
        echo "
\t";
        // line 170
        if ((isset($context["ENABLE_POPUP_LOGIN"]) ? $context["ENABLE_POPUP_LOGIN"] : null)) {
            // line 171
            echo "\t\t<div class=\"modal fade\" id=\"modal-login\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">
\t\t\t<div class=\"modal-dialog\">
\t\t\t\t<div class=\"modal-content\">
\t\t\t\t\t<div class=\"modal-header\">
\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>
\t\t\t\t\t\t<h3 class=\"modal-title\">";
            // line 176
            echo (isset($context["SITENAME"]) ? $context["SITENAME"] : null);
            echo "&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("LOGIN");
            echo "</h3>
\t\t\t\t\t</div>
\t\t\t\t\t<div class=\"modal-body\">
\t\t\t\t\t\t<form method=\"post\" action=\"";
            // line 179
            echo (isset($context["S_LOGIN_ACTION"]) ? $context["S_LOGIN_ACTION"] : null);
            echo "\">
\t\t\t\t\t\t\t<fieldset>
\t\t\t\t\t\t\t\t<label for=\"username\" class=\"control-label\">";
            // line 181
            echo $this->env->getExtension('phpbb')->lang("USERNAME");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t\t\t\t\t\t\t\t<div class=\"input-icon left\">
\t\t\t\t\t\t\t\t\t<i class=\"fa fa-user\"></i>
\t\t\t\t\t\t\t\t\t<input class=\"form-control\" type=\"text\" name=\"username\" id=\"username\" placeholder=\"";
            // line 184
            echo $this->env->getExtension('phpbb')->lang("USERNAME");
            echo "\">
\t\t\t\t\t\t\t\t</div>

\t\t\t\t\t\t\t\t<label for=\"password\" class=\"control-label\">";
            // line 187
            echo $this->env->getExtension('phpbb')->lang("PASSWORD");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t\t\t\t\t\t\t\t<div class=\"input-icon left\">
\t\t\t\t\t\t\t\t\t<i class=\"fa fa-key\"></i>
\t\t\t\t\t\t\t\t\t<input class=\"form-control\" type=\"password\" name=\"password\" id=\"password\" placeholder=\"";
            // line 190
            echo $this->env->getExtension('phpbb')->lang("PASSWORD");
            echo "\">
\t\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t\t";
            // line 192
            if ((isset($context["S_AUTOLOGIN_ENABLED"]) ? $context["S_AUTOLOGIN_ENABLED"] : null)) {
                // line 193
                echo "\t\t\t\t\t\t\t\t\t<div class=\"controls controls-row\">
\t\t\t\t\t\t\t\t\t\t<div class=\"radio\"><input type=\"checkbox\" name=\"autologin\" id=\"autologin-pop\"><label for=\"autologin-pop\">";
                // line 194
                echo $this->env->getExtension('phpbb')->lang("LOG_ME_IN");
                echo "</label></div>
\t\t\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t\t";
            }
            // line 197
            echo "\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\" id=\"load\" name=\"login\" value=\"";
            echo $this->env->getExtension('phpbb')->lang("LOGIN");
            echo "\" data-loading-text=\"";
            echo $this->env->getExtension('phpbb')->lang("LOADING_LOG_IN");
            echo " <i class='fa fa-spin fa-spinner fa-lg icon-white'></i>\">";
            echo $this->env->getExtension('phpbb')->lang("LOGIN");
            echo "</button>
\t\t\t\t\t\t\t\t";
            // line 198
            echo (isset($context["S_LOGIN_REDIRECT"]) ? $context["S_LOGIN_REDIRECT"] : null);
            echo "
\t\t\t\t\t\t\t</fieldset>
\t\t\t\t\t\t</form> 
\t\t\t\t\t</div>
\t\t\t\t\t<div class=\"modal-footer\">
\t\t\t\t\t</div>
\t\t\t\t</div><!-- /.modal-content -->
\t\t\t</div><!-- /.modal-dialog -->
\t\t</div><!-- /.modal -->
\t";
        }
        // line 208
        echo "
<script>
// this loads jquery asyncrounously & in parallel
head.load(\"//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js\", \"";
        // line 211
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/bootstrap/js/bootstrap.min.js\", \"";
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/core.min.js?assets_version=";
        echo (isset($context["T_ASSETS_VERSION"]) ? $context["T_ASSETS_VERSION"] : null);
        echo "\", \"";
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/forum_fn.min.js?assets_version=";
        echo (isset($context["T_ASSETS_VERSION"]) ? $context["T_ASSETS_VERSION"] : null);
        echo "\", \"";
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/ajax.min.js?assets_version=";
        echo (isset($context["T_ASSETS_VERSION"]) ? $context["T_ASSETS_VERSION"] : null);
        echo "\");
</script>

<!-- we use this event to load the JS scripts properly via the extension system -->
";
        // line 215
        // line 216
        echo "
<!-- injected via a module or an include -->
<script>
// some function that depends on bootstrap and jquery
head.ready(function () {
\t\$('.footable').footable();\$(\".selectpicker\").selectpicker();\$(\".selectpicker\").tooltip(\"disable\");var totop=\$(\"#totop\");totop.click(function(){\$(\"html, body\").stop(true,true).animate({scrollTop:0},500);return false});\$(window).scroll(function(){if(\$(this).scrollTop()>600){totop.fadeIn()}else{totop.fadeOut()}});\$(\"button[data-loading-text], input[data-loading-text], .btn-load\").click(function(){var e=\$(this);e.button(\"loading\");setTimeout(function(){e.button(\"reset\")},3e3)});
\t\$(\"input\").iCheck({checkboxClass:\"icheckbox_flat-aero\",radioClass:\"iradio_flat-aero\"});\$(\".btn-search\").click(function(){\$(\".search-input\").toggleClass(\"open\").find(\"input\").focus()});\$(\".close\").click(function(){\$(this).prev(\"input\").val(\"\").parents(\".search-input\").removeClass(\"open\")});\$(\".nav-tog\").click(function(){if(\$(this).hasClass(\"neutro\")){\$(this).removeClass(\"neutro\").addClass(\"open\")}else{\$(this).removeClass(\"open\").addClass(\"neutro\")}});
\t\$('input[data-reset-on-edit]').on('keyup', function() {\$(this.getAttribute('data-reset-on-edit')).val('');});
\tfunction isTouchDevice(){return true==(\"ontouchstart\"in window||window.DocumentTouch&&document instanceof DocumentTouch);}if(isTouchDevice()===false){jQuery(function(e){e(\"a\").tooltip({html:true,container:\"body\"})});}\t
    \$('#notification_list_button').click(function(){setTimeout(function(){\$(\".nano\").nanoScroller();},0);});\t
});
// some function that depends on bootstrap and jquery
head.load(\"";
        // line 228
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/twitterFetcher.min.js\");
head.ready('twitterFetcher.min.js',function(twit){var twit={\"id\":'";
        // line 229
        if ((isset($context["FLATBOOTS_MINI_CMS_ENABLED"]) ? $context["FLATBOOTS_MINI_CMS_ENABLED"] : null)) {
            echo (isset($context["TWITTER_ID"]) ? $context["TWITTER_ID"] : null);
        } else {
            echo "391407906655965184";
        }
        echo "',\"domId\":'twitter-feed',\"maxTweets\":1,\"showUser\":false,\"showImages\":true,\"enableLinks\":true};twitterFetcher.fetch(twit);});
</script>
<!-- injected via a module or an include -->

";
        // line 233
        echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "SCRIPTS", array());
        echo "

";
        // line 235
        if ((isset($context["S_PLUPLOAD"]) ? $context["S_PLUPLOAD"] : null)) {
            // line 236
            echo "<!-- // lets load the plupload crap super huge files becuase... wait for it wait for it. \"swear here\" -->
";
            // line 237
            $location = "plupload.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("plupload.html", "overall_footer.html", 237)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 239
        echo "
";
        // line 240
        // line 241
        echo "
<!-- Google Analytics: change UA-XXXXXXXX-X to be your site's ID. -->
";
        // line 243
        echo (isset($context["GOOGLE_ANALYTICS"]) ? $context["GOOGLE_ANALYTICS"] : null);
        echo "
</body>
</html>";
    }

    public function getTemplateName()
    {
        return "overall_footer.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  555 => 243,  551 => 241,  550 => 240,  547 => 239,  534 => 237,  531 => 236,  529 => 235,  524 => 233,  513 => 229,  509 => 228,  495 => 216,  494 => 215,  475 => 211,  470 => 208,  457 => 198,  448 => 197,  442 => 194,  439 => 193,  437 => 192,  432 => 190,  425 => 187,  419 => 184,  412 => 181,  407 => 179,  399 => 176,  392 => 171,  390 => 170,  387 => 169,  376 => 160,  365 => 158,  361 => 157,  355 => 156,  348 => 152,  341 => 147,  339 => 146,  321 => 133,  306 => 129,  297 => 125,  282 => 114,  275 => 113,  274 => 112,  269 => 111,  268 => 110,  261 => 105,  260 => 104,  249 => 103,  248 => 102,  240 => 96,  234 => 94,  222 => 84,  219 => 83,  217 => 82,  215 => 81,  207 => 75,  203 => 74,  201 => 73,  193 => 71,  190 => 70,  189 => 69,  183 => 68,  177 => 67,  171 => 66,  167 => 65,  164 => 64,  161 => 63,  159 => 62,  157 => 61,  147 => 53,  135 => 44,  126 => 38,  122 => 37,  118 => 36,  110 => 30,  107 => 29,  105 => 28,  103 => 27,  99 => 25,  96 => 24,  84 => 23,  79 => 22,  77 => 21,  75 => 20,  72 => 19,  67 => 16,  52 => 15,  47 => 12,  33 => 10,  31 => 9,  28 => 8,  27 => 7,  20 => 2,  19 => 1,);
    }
}
