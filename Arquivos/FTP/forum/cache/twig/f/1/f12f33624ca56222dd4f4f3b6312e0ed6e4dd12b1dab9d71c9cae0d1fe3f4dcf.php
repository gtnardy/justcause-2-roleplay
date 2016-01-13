<?php

/* ucp_profile_profile_info.html */
class __TwigTemplate_f12f33624ca56222dd4f4f3b6312e0ed6e4dd12b1dab9d71c9cae0d1fe3f4dcf extends Twig_Template
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
        $this->loadTemplate("ucp_header.html", "ucp_profile_profile_info.html", 1)->display($context);
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
\t   <p>";
        // line 6
        echo $this->env->getExtension('phpbb')->lang("PROFILE_INFO_NOTICE");
        echo "</p>
\t
\t";
        // line 8
        if ((isset($context["ERROR"]) ? $context["ERROR"] : null)) {
            // line 9
            echo "\t<div class=\"alert alert-info fade in\">
       <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 10
            echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
            echo "</strong>&nbsp;";
            echo (isset($context["ERROR"]) ? $context["ERROR"] : null);
            echo "
    </div>
\t";
        }
        // line 13
        echo "\t";
        // line 14
        echo "\t
\t";
        // line 15
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "profile_fields", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["profile_fields"]) {
            // line 16
            echo "\t<div class=\"control-group\"> 
\t    <label class=\"control-label\"";
            // line 17
            if ($this->getAttribute($context["profile_fields"], "FIELD_ID", array())) {
                echo " for=\"";
                echo $this->getAttribute($context["profile_fields"], "FIELD_ID", array());
                echo "\"";
            }
            echo ">";
            echo $this->getAttribute($context["profile_fields"], "LANG_NAME", array());
            echo $this->env->getExtension('phpbb')->lang("COLON");
            if ($this->getAttribute($context["profile_fields"], "S_REQUIRED", array())) {
                echo " *";
            }
            echo "</label>";
            if ($this->getAttribute($context["profile_fields"], "LANG_EXPLAIN", array())) {
                echo "<span class=\"help-block\">";
                echo $this->getAttribute($context["profile_fields"], "LANG_EXPLAIN", array());
                echo "</span>";
            }
            // line 18
            echo "\t<div class=\"controls controls-row\"> 
       ";
            // line 19
            echo $this->getAttribute($context["profile_fields"], "FIELD", array());
            echo "
\t</div> 
\t";
            // line 21
            if ($this->getAttribute($context["profile_fields"], "ERROR", array())) {
                echo "<span class=\"error\">";
                echo $this->getAttribute($context["profile_fields"], "ERROR", array());
                echo "</span>";
            }
            // line 22
            echo "\t</div> 
\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['profile_fields'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 24
        echo "\t
\t";
        // line 25
        if ((isset($context["S_JABBER_ENABLED"]) ? $context["S_JABBER_ENABLED"] : null)) {
            // line 26
            echo "\t<div class=\"control-group\"> 
\t    <label for=\"jabber\" class=\"control-label\">";
            // line 27
            echo $this->env->getExtension('phpbb')->lang("UCP_JABBER");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
\t<div class=\"controls controls-row\"> 
       <input type=\"text\" name=\"jabber\" id=\"jabber\" maxlength=\"255\" value=\"";
            // line 29
            echo (isset($context["JABBER"]) ? $context["JABBER"] : null);
            echo "\" placeholder=\"Jabber e-mail address\" class=\"form-control input-sm\">
\t</div> 
\t</div> 
\t";
        }
        // line 33
        echo "\t
 ";
        // line 34
        if ((isset($context["S_BIRTHDAYS_ENABLED"]) ? $context["S_BIRTHDAYS_ENABLED"] : null)) {
            // line 35
            echo "    <div class=\"control-group\"> 
        <label for=\"width\" class=\"control-label\">";
            // line 36
            echo $this->env->getExtension('phpbb')->lang("BIRTHDAY");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label><span class=\"help-block\">";
            echo $this->env->getExtension('phpbb')->lang("BIRTHDAY_EXPLAIN");
            echo "</span>
    <div class=\"controls controls-row\"> 
    
\t<div class=\"clearfix\"> 
     <div class=\"col-md-2\">
            <label for=\"bday_day\" class=\"control-label\">";
            // line 41
            echo $this->env->getExtension('phpbb')->lang("DAY");
            echo "</label>
        <div class=\"controls\">
            <div class=\"selector\"><select data-width=\"auto\" name=\"bday_day\" id=\"bday_day\" data-container=\"body\" class=\"selectpicker\">";
            // line 43
            echo (isset($context["S_BIRTHDAY_DAY_OPTIONS"]) ? $context["S_BIRTHDAY_DAY_OPTIONS"] : null);
            echo "</select></div>  
        </div>
     </div>
     <div class=\"col-md-2\">
            <label for=\"bday_month\" class=\"control-label\">";
            // line 47
            echo $this->env->getExtension('phpbb')->lang("MONTH");
            echo "</label>
        <div class=\"controls\">
\t\t\t<div class=\"selector\"><select data-width=\"auto\" name=\"bday_month\" id=\"bday_month\" data-container=\"body\" class=\"selectpicker\">";
            // line 49
            echo (isset($context["S_BIRTHDAY_MONTH_OPTIONS"]) ? $context["S_BIRTHDAY_MONTH_OPTIONS"] : null);
            echo "</select></div>
        </div>
     </div>
     <div class=\"col-md-2\">
           <label for=\"bday_year\" class=\"control-label\">";
            // line 53
            echo $this->env->getExtension('phpbb')->lang("YEAR");
            echo "</label>
        <div class=\"controls\">
\t\t\t <div class=\"selector\"><select data-width=\"auto\" name=\"bday_year\" id=\"bday_year\" data-container=\"body\" class=\"selectpicker\">";
            // line 55
            echo (isset($context["S_BIRTHDAY_YEAR_OPTIONS"]) ? $context["S_BIRTHDAY_YEAR_OPTIONS"] : null);
            echo "</select></div>
        </div>
     </div>
\t</div>
\t 
    </div> 
\t</div> 
 ";
        }
        // line 62
        echo "\t
    ";
        // line 63
        // line 64
        echo "\t</fieldset>

</div>

    <div class=\"space10\"></div>
\t<div class=\"form-actions\"> 
\t";
        // line 70
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t <button type=\"reset\" value=\"";
        // line 71
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "\" name=\"reset\" class=\"btn btn-default\">";
        echo $this->env->getExtension('phpbb')->lang("RESET");
        echo "</button> 
\t <button type=\"submit\" name=\"submit\" value=\"";
        // line 72
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "\" class=\"btn btn-default\" autocomplete=\"off\" data-loading-text=\"";
        echo $this->env->getExtension('phpbb')->lang("LOADING");
        echo "<i class='fa fa-spin fa-spinner fa-lg icon-white'></i>\">";
        echo $this->env->getExtension('phpbb')->lang("SUBMIT");
        echo "</button>
\t";
        // line 73
        echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
        echo "
\t</div>
\t
</form>

";
        // line 78
        $location = "ucp_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("ucp_footer.html", "ucp_profile_profile_info.html", 78)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "ucp_profile_profile_info.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  231 => 78,  223 => 73,  215 => 72,  209 => 71,  205 => 70,  197 => 64,  196 => 63,  193 => 62,  182 => 55,  177 => 53,  170 => 49,  165 => 47,  158 => 43,  153 => 41,  142 => 36,  139 => 35,  137 => 34,  134 => 33,  127 => 29,  121 => 27,  118 => 26,  116 => 25,  113 => 24,  106 => 22,  100 => 21,  95 => 19,  92 => 18,  74 => 17,  71 => 16,  67 => 15,  64 => 14,  62 => 13,  54 => 10,  51 => 9,  49 => 8,  44 => 6,  40 => 5,  31 => 2,  19 => 1,);
    }
}
