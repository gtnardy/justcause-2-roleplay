<?php

/* ucp_profile_reg_details.html */
class __TwigTemplate_f55ea65e857aa295cf6d456d20808bc57db2e518aa6f151f32f7e329468baa4c extends Twig_Template
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
        $location = "ucp_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("ucp_header.html", "ucp_profile_reg_details.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "<form id=\"ucp\" method=\"post\" action=\"";
        echo (isset($context["S_UCP_ACTION"]) ? $context["S_UCP_ACTION"] : null);
        echo "\"";
        echo (isset($context["S_FORM_ENCTYPE"]) ? $context["S_FORM_ENCTYPE"] : null);
        echo ">
<div class=\"tab-pane active\">
\t<fieldset class=\"framed-ucp\">
\t <legend>";
        // line 5
        echo $this->env->getExtension('phpbb')->lang("TITLE");
        echo "</legend>
\t 
\t ";
        // line 7
        if ((isset($context["S_FORCE_PASSWORD"]) ? $context["S_FORCE_PASSWORD"] : null)) {
            // line 8
            echo "\t\t<p>";
            echo $this->env->getExtension('phpbb')->lang("FORCE_PASSWORD_EXPLAIN");
            echo "</p>
\t";
        }
        // line 10
        echo "\t 
\t";
        // line 11
        if ((isset($context["ERROR"]) ? $context["ERROR"] : null)) {
            // line 12
            echo "\t<div class=\"alert alert-info fade in\">
       <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 13
            echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
            echo "</strong>&nbsp;";
            echo (isset($context["ERROR"]) ? $context["ERROR"] : null);
            echo "
    </div>
\t";
        }
        // line 16
        echo "   ";
        // line 17
        echo "    <div class=\"control-group\"> 
\t<label class=\"control-label\"";
        // line 18
        if ((isset($context["S_CHANGE_USERNAME"]) ? $context["S_CHANGE_USERNAME"] : null)) {
            echo " for=\"username\"";
        }
        echo ">";
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        echo $this->env->getExtension('phpbb')->lang("USERNAME_EXPLAIN");
        echo "</span>
\t<div class=\"controls controls-row\"> 
       ";
        // line 20
        if ((isset($context["S_CHANGE_USERNAME"]) ? $context["S_CHANGE_USERNAME"] : null)) {
            echo "<input class=\"form-control input-sm\" type=\"text\" name=\"username\" id=\"username\" value=\"";
            echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("USERNAME");
            echo "\" placeholder=\"";
            echo $this->env->getExtension('phpbb')->lang("USERNAME");
            echo "\">";
        } else {
            echo "<input class=\"form-control input-sm\" type=\"text\" disabled=\"\" placeholder=\"";
            echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
            echo " ";
            echo $this->env->getExtension('phpbb')->lang("UCP_NO_USER_CHANGE_ALLOWED");
            echo "\">";
        }
        // line 21
        echo "\t</div> 
\t</div> 
   
    <div class=\"control-group\"> 
\t<label class=\"control-label\" for=\"email\">";
        // line 25
        echo $this->env->getExtension('phpbb')->lang("EMAIL_ADDRESS");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t<div class=\"controls controls-row\"> 
    ";
        // line 27
        if ((isset($context["S_CHANGE_EMAIL"]) ? $context["S_CHANGE_EMAIL"] : null)) {
            echo "<input class=\"form-control input-sm\" type=\"text\" name=\"email\" id=\"email\" maxlength=\"100\" value=\"";
            echo (isset($context["EMAIL"]) ? $context["EMAIL"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("EMAIL_ADDRESS");
            echo "\" placeholder=\"";
            echo $this->env->getExtension('phpbb')->lang("EMAIL_ADDRESS");
            echo "\">";
        } else {
            echo "<input class=\"form-control input-sm\" type=\"text\" disabled=\"\" placeholder=\"";
            echo (isset($context["EMAIL"]) ? $context["EMAIL"] : null);
            echo "\">";
        }
        // line 28
        echo "\t
\t</div> 
\t</div> 
\t
\t";
        // line 32
        if ((isset($context["S_CHANGE_PASSWORD"]) ? $context["S_CHANGE_PASSWORD"] : null)) {
            // line 33
            echo "    <div class=\"control-group\"> 
\t <label for=\"new_password\" class=\"control-label\">";
            // line 34
            echo $this->env->getExtension('phpbb')->lang("NEW_PASSWORD");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label><span class=\"help-block\">";
            echo $this->env->getExtension('phpbb')->lang("CHANGE_PASSWORD_EXPLAIN");
            echo "</span>
\t<div class=\"controls controls-row\"> 
     <input type=\"password\" name=\"new_password\" id=\"new_password\" maxlength=\"255\" value=\"";
            // line 36
            echo (isset($context["NEW_PASSWORD"]) ? $context["NEW_PASSWORD"] : null);
            echo "\" placeholder=\"";
            echo $this->env->getExtension('phpbb')->lang("CHANGE_PASSWORD");
            echo "\" class=\"form-control input-sm\">
     <div class=\"space10\"></div>
\t <label for=\"password_confirm\" class=\"control-label\">";
            // line 38
            echo $this->env->getExtension('phpbb')->lang("CONFIRM_PASSWORD");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label><span class=\"help-block\">";
            echo $this->env->getExtension('phpbb')->lang("CONFIRM_PASSWORD_EXPLAIN");
            echo "</span>
\t    <input type=\"password\" name=\"password_confirm\" id=\"password_confirm\" maxlength=\"255\" value=\"";
            // line 39
            echo (isset($context["PASSWORD_CONFIRM"]) ? $context["PASSWORD_CONFIRM"] : null);
            echo "\" placeholder=\"";
            echo $this->env->getExtension('phpbb')->lang("CONFIRM_PASSWORD");
            echo "\" class=\"form-control input-sm\">
\t</div> 
\t</div> 
    ";
        }
        // line 43
        echo "    ";
        echo "\t
\t</fieldset>

\t<div class=\"space10\"></div>
\t <div class=\"space10\"></div>

\t<fieldset class=\"framed-ucp\">
\t <legend>";
        // line 50
        echo $this->env->getExtension('phpbb')->lang("CURRENT_PASSWORD");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</legend>
    <div class=\"controls controls-row\"> 
      <label for=\"cur_password\" class=\"control-label\">";
        // line 52
        echo $this->env->getExtension('phpbb')->lang("CURRENT_PASSWORD");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label><span class=\"help-block\">";
        if ((isset($context["S_CHANGE_PASSWORD"]) ? $context["S_CHANGE_PASSWORD"] : null)) {
            echo $this->env->getExtension('phpbb')->lang("CURRENT_CHANGE_PASSWORD_EXPLAIN");
        } else {
            echo $this->env->getExtension('phpbb')->lang("CURRENT_PASSWORD_EXPLAIN");
        }
        echo "</span>
     <div class=\"controls\">
        <input type=\"password\" name=\"cur_password\" id=\"cur_password\" maxlength=\"255\" value=\"";
        // line 54
        echo (isset($context["CUR_PASSWORD"]) ? $context["CUR_PASSWORD"] : null);
        echo "\" title=\"";
        echo $this->env->getExtension('phpbb')->lang("CURRENT_PASSWORD");
        echo "\" placeholder=\"";
        echo $this->env->getExtension('phpbb')->lang("CURRENT_PASSWORD");
        echo "\" class=\"form-control input-sm\">
     </div>
    </div>
\t</fieldset>
    
\t<div class=\"space10\"></div>
\t<div class=\"form-actions\"> 
\t";
        // line 61
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t<button type=\"reset\" value=\"";
        // line 62
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "\" name=\"reset\" class=\"btn btn-default\">";
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "</button>
\t<button type=\"submit\" name=\"submit\" value=\"";
        // line 63
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "\" class=\"btn btn-default\" autocomplete=\"off\" data-loading-text=\"";
        echo $this->env->getExtension('phpbb')->lang("LOADING");
        echo "<i class='fa fa-spin fa-spinner fa-lg icon-white'></i>\">";
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "</button>
\t";
        // line 64
        echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
        echo "
\t</div>
</div>
</form>

";
        // line 69
        $location = "ucp_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("ucp_footer.html", "ucp_profile_reg_details.html", 69)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "ucp_profile_reg_details.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  238 => 69,  230 => 64,  222 => 63,  216 => 62,  212 => 61,  198 => 54,  186 => 52,  180 => 50,  170 => 43,  161 => 39,  154 => 38,  147 => 36,  139 => 34,  136 => 33,  134 => 32,  128 => 28,  114 => 27,  108 => 25,  102 => 21,  86 => 20,  74 => 18,  71 => 17,  69 => 16,  61 => 13,  58 => 12,  56 => 11,  53 => 10,  47 => 8,  45 => 7,  40 => 5,  31 => 2,  19 => 1,);
    }
}
