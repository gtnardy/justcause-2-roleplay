<?php

/* message_body.html */
class __TwigTemplate_369e879a56dc5e2bc9eb6ead30f27c1886f87be80bd375dbf83cbb2218211fcf extends Twig_Template
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
        if ((isset($context["S_SIMPLE_MESSAGE"]) ? $context["S_SIMPLE_MESSAGE"] : null)) {
            // line 2
            echo "\t";
            $location = "simple_header.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("simple_header.html", "message_body.html", 2)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        } else {
            // line 4
            echo "\t";
            $location = "overall_header.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("overall_header.html", "message_body.html", 4)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 6
        echo "
<div class=\"side-segment\"><h3>";
        // line 7
        echo (isset($context["MESSAGE_TITLE"]) ? $context["MESSAGE_TITLE"] : null);
        echo "</h3></div>
<div class=\"well\" id=\"message\">
\t<p>";
        // line 9
        echo (isset($context["MESSAGE_TEXT"]) ? $context["MESSAGE_TEXT"] : null);
        echo "</p>
\t";
        // line 10
        if ((((((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "search") &&  !(isset($context["S_BOARD_DISABLED"]) ? $context["S_BOARD_DISABLED"] : null)) &&  !(isset($context["S_NO_SEARCH"]) ? $context["S_NO_SEARCH"] : null)) && (isset($context["L_RETURN_TO_SEARCH_ADV"]) ? $context["L_RETURN_TO_SEARCH_ADV"] : null))) {
            // line 11
            echo "\t <p><a class=\"btn-link\" href=\"";
            echo (isset($context["U_SEARCH"]) ? $context["U_SEARCH"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("RETURN_TO_SEARCH_ADV");
            echo "</a></p>
\t ";
        }
        // line 13
        echo "</div>

";
        // line 15
        if ((isset($context["S_SIMPLE_MESSAGE"]) ? $context["S_SIMPLE_MESSAGE"] : null)) {
            // line 16
            echo "\t";
            $location = "simple_footer.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("simple_footer.html", "message_body.html", 16)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        } else {
            // line 18
            echo "\t";
            $location = "overall_footer.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("overall_footer.html", "message_body.html", 18)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
    }

    public function getTemplateName()
    {
        return "message_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  91 => 18,  77 => 16,  75 => 15,  71 => 13,  63 => 11,  61 => 10,  57 => 9,  52 => 7,  49 => 6,  35 => 4,  21 => 2,  19 => 1,);
    }
}
