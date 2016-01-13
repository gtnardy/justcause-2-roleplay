<?php

/* viewtopic_topic_tools.html */
class __TwigTemplate_ee0d60e296f08ee4ff47c0848ea165f7b218634af58454ce4803083293ea974d extends Twig_Template
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
        if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && ((((((isset($context["U_WATCH_TOPIC"]) ? $context["U_WATCH_TOPIC"] : null) || (isset($context["U_BOOKMARK_TOPIC"]) ? $context["U_BOOKMARK_TOPIC"] : null)) || (isset($context["U_BUMP_TOPIC"]) ? $context["U_BUMP_TOPIC"] : null)) || (isset($context["U_EMAIL_TOPIC"]) ? $context["U_EMAIL_TOPIC"] : null)) || (isset($context["U_PRINT_TOPIC"]) ? $context["U_PRINT_TOPIC"] : null)) || (isset($context["S_DISPLAY_TOPIC_TOOLS"]) ? $context["S_DISPLAY_TOPIC_TOOLS"] : null)))) {
            // line 3
            echo "<div class=\"btn-group\">
   \t";
            // line 4
            if ((isset($context["U_EMAIL_TOPIC"]) ? $context["U_EMAIL_TOPIC"] : null)) {
                echo "<a class=\"btn btn-default\" href=\"";
                echo (isset($context["U_EMAIL_TOPIC"]) ? $context["U_EMAIL_TOPIC"] : null);
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("EMAIL_TOPIC");
                echo "\"><i class=\"fa fa-envelope\"></i></a>";
            }
            // line 5
            echo "\t";
            if ((isset($context["U_PRINT_TOPIC"]) ? $context["U_PRINT_TOPIC"] : null)) {
                echo "<a class=\"btn btn-default\" href=\"";
                echo (isset($context["U_PRINT_TOPIC"]) ? $context["U_PRINT_TOPIC"] : null);
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("PRINT_TOPIC");
                echo "\" accesskey=\"p\"><i class=\"fa fa-print\"></i></a>";
            }
            // line 6
            echo "</div>

<div class=\"btn-group t-";
            // line 8
            if ((isset($context["S_WATCHING_TOPIC"]) ? $context["S_WATCHING_TOPIC"] : null)) {
                echo "unsubscribe";
            } else {
                echo "subscribe";
            }
            echo "\">
\t";
            // line 9
            if ((isset($context["U_WATCH_TOPIC"]) ? $context["U_WATCH_TOPIC"] : null)) {
                // line 10
                echo "\t   <a href=\"";
                echo (isset($context["U_WATCH_TOPIC"]) ? $context["U_WATCH_TOPIC"] : null);
                echo "\" class=\"watch-topic-link btn btn-default t-icon\" title=\"";
                echo (isset($context["S_WATCH_TOPIC_TITLE"]) ? $context["S_WATCH_TOPIC_TITLE"] : null);
                echo "\" data-ajax=\"toggle_link\" data-toggle-class=\"btn-group t-";
                if ( !(isset($context["S_WATCHING_TOPIC"]) ? $context["S_WATCHING_TOPIC"] : null)) {
                    echo "unsubscribe";
                } else {
                    echo "subscribe";
                }
                echo "\" data-toggle-url=\"";
                echo (isset($context["U_WATCH_TOPIC_TOGGLE"]) ? $context["U_WATCH_TOPIC_TOGGLE"] : null);
                echo "\" data-update-all=\".watch-topic-link\"></a>
\t";
            }
            // line 12
            echo "\t";
            if ((isset($context["U_BOOKMARK_TOPIC"]) ? $context["U_BOOKMARK_TOPIC"] : null)) {
                // line 13
                echo "\t <a href=\"";
                echo (isset($context["U_BOOKMARK_TOPIC"]) ? $context["U_BOOKMARK_TOPIC"] : null);
                echo "\" class=\"bookmark-link t-icon btn btn-default t-";
                if ((isset($context["S_BOOKMARKED_TOPIC"]) ? $context["S_BOOKMARKED_TOPIC"] : null)) {
                    echo "bookmarked";
                } else {
                    echo "bookmark";
                }
                echo "\" title=\"";
                if ((isset($context["S_BOOKMARKED_TOPIC"]) ? $context["S_BOOKMARKED_TOPIC"] : null)) {
                    echo $this->env->getExtension('phpbb')->lang("BOOKMARK_TOPIC_REMOVE");
                } else {
                    echo $this->env->getExtension('phpbb')->lang("BOOKMARK_TOPIC");
                }
                echo "\" data-ajax=\"alt_text\" data-toggle-url=\"";
                echo (isset($context["S_BOOKMARK_TOGGLE"]) ? $context["S_BOOKMARK_TOGGLE"] : null);
                echo "\" data-update-all=\".bookmark-link\"></a>
\t";
            }
            // line 15
            echo "</div>
";
            // line 16
            if ((isset($context["U_BUMP_TOPIC"]) ? $context["U_BUMP_TOPIC"] : null)) {
                echo "<a class=\"btn btn-default\" href=\"";
                echo (isset($context["U_BUMP_TOPIC"]) ? $context["U_BUMP_TOPIC"] : null);
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("BUMP_TOPIC");
                echo "\" data-ajax=\"true\"><i class=\"fa fa-legal\"></i></a>";
            }
        }
        // line 18
        // line 19
        echo "

    ";
    }

    public function getTemplateName()
    {
        return "viewtopic_topic_tools.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  108 => 19,  107 => 18,  98 => 16,  95 => 15,  75 => 13,  72 => 12,  56 => 10,  54 => 9,  46 => 8,  42 => 6,  33 => 5,  25 => 4,  22 => 3,  20 => 2,  19 => 1,);
    }
}
