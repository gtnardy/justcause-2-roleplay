<?php

/* addons/header_teaser_body.html */
class __TwigTemplate_418d84f4aeb17a12245eb216d7e349f4caed98c1e80a0c7b0ef28a31a31bbb1b extends Twig_Template
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
        echo "<div class=\"masthead flat-header\">
    <div class=\"wrapper-head\">
\t <div class=\"container\">
\t \t";
        // line 4
        if ((((isset($context["TEASER_TITLE"]) ? $context["TEASER_TITLE"] : null) != "") || ((isset($context["TEASER_TEXT"]) ? $context["TEASER_TEXT"] : null) != ""))) {
            // line 5
            echo "\t \t\t<h1>";
            echo (isset($context["TEASER_TITLE"]) ? $context["TEASER_TITLE"] : null);
            echo "</h1>
       \t\t<p>";
            // line 6
            echo (isset($context["TEASER_TEXT"]) ? $context["TEASER_TEXT"] : null);
            echo "</p>
\t \t";
        } else {
            // line 8
            echo "\t\t\t<h1>";
            echo $this->env->getExtension('phpbb')->lang("FLATBOOTS_INTRO");
            echo "&nbsp;<a class=\"label label-call\" href=\"http://getbootstrap.com/\">";
            echo $this->env->getExtension('phpbb')->lang("BOOTSTRAP_VERSION");
            echo "</a></h1>
\t\t\t<p>";
            // line 9
            echo $this->env->getExtension('phpbb')->lang("FLATBOOTS_EXPLAIN");
            echo "</p>
        ";
        }
        // line 11
        echo "     </div>
\t</div>
</div>";
    }

    public function getTemplateName()
    {
        return "addons/header_teaser_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  48 => 11,  43 => 9,  36 => 8,  31 => 6,  26 => 5,  24 => 4,  19 => 1,);
    }
}
