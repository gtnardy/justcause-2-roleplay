<?php

/* ucp_avatar_options.html */
class __TwigTemplate_cd70ac859a6a52b470b637bd55165d603cfddacb97e4294915733ab1b3d5dbed extends Twig_Template
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
        echo "<div class=\"tab-pane active\">
<fieldset class=\"framed-ucp\">
\t<legend>";
        // line 3
        echo $this->env->getExtension('phpbb')->lang("TITLE");
        echo "</legend>
\t
\t";
        // line 5
        if ( !(isset($context["S_AVATARS_ENABLED"]) ? $context["S_AVATARS_ENABLED"] : null)) {
            // line 6
            echo "\t\t<p>";
            echo $this->env->getExtension('phpbb')->lang("AVATAR_FEATURES_DISABLED");
            echo "</p>
\t";
        }
        // line 8
        echo "\t
\t";
        // line 9
        if ((isset($context["ERROR"]) ? $context["ERROR"] : null)) {
            // line 10
            echo "\t<div class=\"alert alert-info fade in\">
      <i class=\"fa fa-warning\"></i><strong>&nbsp;";
            // line 11
            echo $this->env->getExtension('phpbb')->lang("INFO_BOX");
            echo "</strong>&nbsp;";
            echo (isset($context["ERROR"]) ? $context["ERROR"] : null);
            echo "
    </div>
\t";
        }
        // line 14
        echo "\t
\t<div class=\"controls controls-row\"> 
\t <label for=\"avatar\" class=\"control-label\">";
        // line 16
        echo $this->env->getExtension('phpbb')->lang("CURRENT_IMAGE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t<div class=\"fileinput-new thumbnail\" style=\"width: 100px; height: 100px;\">
\t\t ";
        // line 18
        if ((isset($context["AVATAR"]) ? $context["AVATAR"] : null)) {
            echo (isset($context["AVATAR"]) ? $context["AVATAR"] : null);
        } else {
            echo "<img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/no_avatar.gif\" alt=\"\" />";
        }
        // line 19
        echo "\t\t</div>
\t   <div class=\"clearfix\">
\t\t  ";
        // line 21
        if ((isset($context["AVATAR"]) ? $context["AVATAR"] : null)) {
            echo "<input type=\"checkbox\" name=\"avatar_delete\" id=\"avatar_delete\"><label class=\"checkbox-inline\" for=\"avatar_delete\">";
            echo $this->env->getExtension('phpbb')->lang("DELETE_AVATAR");
            echo "</label>";
        } else {
        }
        // line 22
        echo "\t   </div>
\t   <div class=\"help-block\"><span class=\"label label-info\">";
        // line 23
        echo $this->env->getExtension('phpbb')->lang("NOTE");
        echo "</span>&nbsp;";
        echo $this->env->getExtension('phpbb')->lang("AVATAR_EXPLAIN");
        echo "</div>
\t</div>
 
    <div class=\"space10\"></div>
\t <div class=\"space10\"></div>
\t
\t<fieldset class=\"framed-ucp\">
\t <legend>";
        // line 30
        echo $this->env->getExtension('phpbb')->lang("UCP_AVATAR_SELECT_OPTIONS");
        echo "</legend>
\t <div class=\"control-group\">
\t    <label class=\"control-label\" for=\"avatar_driver\">";
        // line 32
        echo $this->env->getExtension('phpbb')->lang("AVATAR_TYPE");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t<div class=\"controls controls-row\"> 
\t\t\t<select class=\"selectpicker\" data-container=\"body\" name=\"avatar_driver\" id=\"avatar_driver\" data-togglable-settings=\"true\">
\t\t\t\t";
        // line 35
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "avatar_drivers", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["avatar_drivers"]) {
            // line 36
            echo "\t\t\t\t<option value=\"";
            echo $this->getAttribute($context["avatar_drivers"], "DRIVER", array());
            echo "\"";
            if ($this->getAttribute($context["avatar_drivers"], "SELECTED", array())) {
                echo " selected=\"selected\"";
            }
            echo " data-toggle-setting=\"#avatar_option_";
            echo $this->getAttribute($context["avatar_drivers"], "DRIVER", array());
            echo "\">";
            echo $this->getAttribute($context["avatar_drivers"], "L_TITLE", array());
            echo "</option>
\t\t\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['avatar_drivers'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 38
        echo "\t\t\t</select>
\t\t</div>
\t   </div>
\t<div class=\"space10\"></div>
\t
\t<div id=\"avatar_options\">
     ";
        // line 44
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "avatar_drivers", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["avatar_drivers"]) {
            // line 45
            echo "\t <div id=\"avatar_option_";
            echo $this->getAttribute($context["avatar_drivers"], "DRIVER", array());
            echo "\">
\t  <noscript><h3 class=\"avatar_section_header\">";
            // line 46
            echo $this->getAttribute($context["avatar_drivers"], "L_TITLE", array());
            echo "</h3></noscript>
\t <p>";
            // line 47
            echo $this->getAttribute($context["avatar_drivers"], "L_EXPLAIN", array());
            echo "</p>
\t   ";
            // line 48
            echo $this->getAttribute($context["avatar_drivers"], "OUTPUT", array());
            echo "
\t  </div>
     ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['avatar_drivers'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 51
        echo "\t</div>
\t
";
        // line 53
        if ( !(isset($context["S_GROUP_MANAGE"]) ? $context["S_GROUP_MANAGE"] : null)) {
            // line 54
            echo "<div class=\"space10\"></div>
 <div class=\"space10\"></div>
\t<button  type=\"reset\" class=\"btn btn-default\" value=\"";
            // line 56
            echo $this->env->getExtension('phpbb')->lang("RESET");
            echo "\" name=\"reset\">";
            echo $this->env->getExtension('phpbb')->lang("RESET");
            echo "</button>
\t<button type=\"submit\" class=\"btn btn-default\" name=\"submit\" value=\"";
            // line 57
            echo $this->env->getExtension('phpbb')->lang("SUBMIT");
            echo "\" autocomplete=\"off\" data-loading-text=\"";
            echo $this->env->getExtension('phpbb')->lang("LOADING");
            echo "<i class='fa-spin fa fa-spinner fa-lg icon-white'></i>\">";
            echo $this->env->getExtension('phpbb')->lang("SUBMIT");
            echo "</button>
";
        }
        // line 59
        echo "    </fieldset>
</fieldset>
</div>
";
    }

    public function getTemplateName()
    {
        return "ucp_avatar_options.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  188 => 59,  179 => 57,  173 => 56,  169 => 54,  167 => 53,  163 => 51,  154 => 48,  150 => 47,  146 => 46,  141 => 45,  137 => 44,  129 => 38,  112 => 36,  108 => 35,  101 => 32,  96 => 30,  84 => 23,  81 => 22,  74 => 21,  70 => 19,  62 => 18,  56 => 16,  52 => 14,  44 => 11,  41 => 10,  39 => 9,  36 => 8,  30 => 6,  28 => 5,  23 => 3,  19 => 1,);
    }
}
