<?php

/* index_body.html */
class __TwigTemplate_d86a50ffc884d6fa464cbbcbecbe114cd3fc5a5ac520b408b2434f6261833e11 extends Twig_Template
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
        $location = "overall_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_header.html", "index_body.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        $location = "forumlist_body.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("forumlist_body.html", "index_body.html", 2)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 3
        // line 4
        echo "
";
        // line 5
        // line 6
        if ((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null)) {
            // line 7
            echo "<div class=\"panel panel-forum panel-stats\">
 <div class=\"panel-heading\">";
            // line 8
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_STATISTICS");
            echo "</div>
 <div class=\"panel-body\">
    <div class=\"row\">
\t  <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-acqua\">";
            // line 12
            echo (isset($context["SITESPLAT_CURRENTLY_ONLINE"]) ? $context["SITESPLAT_CURRENTLY_ONLINE"] : null);
            echo "&nbsp;<a data-toggle=\"collapse\" data-target=\".sorting\" href=\"javascript:void(0);\" title=\"Toggle list\"><i class=\"fa fa-angle-double-down\"></i></a></span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_USERS_ONLINE");
            echo "</strong>
\t   </div>
\t   <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-seppia\">";
            // line 15
            echo (isset($context["SITESPLAT_RECORD_ONLINE"]) ? $context["SITESPLAT_RECORD_ONLINE"] : null);
            echo "</span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_MOST_USERS_ONLINE");
            echo "</strong>
\t   </div>
\t   <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-melograno\">";
            // line 18
            echo (isset($context["SITESPLAT_TOTAL_POSTS"]) ? $context["SITESPLAT_TOTAL_POSTS"] : null);
            echo "</span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_TOTAL_POSTS");
            echo "</strong>
\t   </div>
\t   
\t <div class=\"visible-xs space10\"></div>
\t  <div class=\"visible-xs space10\"></div>
\t  
\t   <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-drank\">";
            // line 25
            echo (isset($context["SITESPLAT_TOTAL_TOPICS"]) ? $context["SITESPLAT_TOTAL_TOPICS"] : null);
            echo "</span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_TOTAL_TOPICS");
            echo "</strong>
\t   </div>
\t   <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-orange\">";
            // line 28
            echo (isset($context["SITESPLAT_TOTAL_USERS"]) ? $context["SITESPLAT_TOTAL_USERS"] : null);
            echo "</span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_TOTAL_USERS");
            echo "</strong>
\t   </div>
\t   <div class=\"col-md-2 col-sm-2 col-xs-4 text-center\">
\t    <span class=\"output text-red\">";
            // line 31
            echo (isset($context["SITESPLAT_NEWEST_USER"]) ? $context["SITESPLAT_NEWEST_USER"] : null);
            echo "</span><strong>";
            echo $this->env->getExtension('phpbb')->lang("SITESPLAT_NEWEST_MEMBER");
            echo "</strong>
\t   </div> 
\t</div>
 </div>
 ";
            // line 35
            if ((isset($context["S_DISPLAY_ONLINE_LIST"]) ? $context["S_DISPLAY_ONLINE_LIST"] : null)) {
                // line 36
                echo "\t<div class=\"panel-footer sorting collapse\">
\t <div class=\"row\">
\t   <div class=\"col-md-6\">
\t    ";
                // line 39
                // line 40
                echo "\t\t<span class=\"stats-heading\">";
                echo (isset($context["TOTAL_USERS_ONLINE"]) ? $context["TOTAL_USERS_ONLINE"] : null);
                echo "&nbsp;&#40;";
                echo $this->env->getExtension('phpbb')->lang("ONLINE_EXPLAIN");
                echo "&#41;&nbsp;";
                if ((isset($context["U_VIEWONLINE"]) ? $context["U_VIEWONLINE"] : null)) {
                    echo "<a href=\"";
                    echo (isset($context["U_VIEWONLINE"]) ? $context["U_VIEWONLINE"] : null);
                    echo "\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("WHO_IS_ONLINE");
                    echo "\"><i class=\"fa fa-question-circle\"></i></a>";
                }
                echo "</span>
\t\t";
                // line 41
                if ((isset($context["LEGEND"]) ? $context["LEGEND"] : null)) {
                    // line 42
                    echo "\t\t  <div class=\"space10\"></div>
\t\t <small>";
                    // line 43
                    echo $this->env->getExtension('phpbb')->lang("LEGEND");
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "&nbsp;";
                    echo (isset($context["LEGEND"]) ? $context["LEGEND"] : null);
                    echo "</small>
\t\t";
                }
                // line 45
                echo "\t\t
\t\t";
                // line 46
                // line 47
                echo "\t\t<p>";
                echo (isset($context["LOGGED_IN_USER_LIST"]) ? $context["LOGGED_IN_USER_LIST"] : null);
                echo "</p>
\t\t";
                // line 48
                // line 49
                echo "\t 
\t\t";
                // line 50
                if ((isset($context["S_DISPLAY_BIRTHDAY_LIST"]) ? $context["S_DISPLAY_BIRTHDAY_LIST"] : null)) {
                    // line 51
                    echo "\t\t ";
                    // line 52
                    echo "\t\t  <p>";
                    if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "birthdays", array()))) {
                        echo $this->env->getExtension('phpbb')->lang("CONGRATULATIONS");
                        echo $this->env->getExtension('phpbb')->lang("COLON");
                        echo "&nbsp;<strong>";
                        $context['_parent'] = (array) $context;
                        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "birthdays", array()));
                        foreach ($context['_seq'] as $context["_key"] => $context["birthdays"]) {
                            echo $this->getAttribute($context["birthdays"], "USERNAME", array());
                            if (($this->getAttribute($context["birthdays"], "AGE", array()) !== "")) {
                                echo "&#40;";
                                echo $this->getAttribute($context["birthdays"], "AGE", array());
                                echo "&#41;";
                            }
                            if ( !$this->getAttribute($context["birthdays"], "S_LAST_ROW", array())) {
                                echo "&#44;&nbsp;";
                            }
                        }
                        $_parent = $context['_parent'];
                        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['birthdays'], $context['_parent'], $context['loop']);
                        $context = array_intersect_key($context, $_parent) + $_parent;
                        echo "</strong>";
                    }
                    echo "</p>
\t\t ";
                    // line 53
                    // line 54
                    echo "\t\t";
                }
                // line 55
                echo "\t   </div>
\t   <div class=\"col-md-6\">
\t    ";
                // line 57
                echo " 
\t   </div>
\t </div>
\t</div>
 ";
            }
            // line 62
            echo "</div>
";
        }
        // line 64
        // line 65
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "index_body.html", 65)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 66
        echo "
";
    }

    public function getTemplateName()
    {
        return "index_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  224 => 66,  212 => 65,  211 => 64,  207 => 62,  200 => 57,  196 => 55,  193 => 54,  192 => 53,  166 => 52,  164 => 51,  162 => 50,  159 => 49,  158 => 48,  153 => 47,  152 => 46,  149 => 45,  141 => 43,  138 => 42,  136 => 41,  121 => 40,  120 => 39,  115 => 36,  113 => 35,  104 => 31,  96 => 28,  88 => 25,  76 => 18,  68 => 15,  60 => 12,  53 => 8,  50 => 7,  48 => 6,  47 => 5,  44 => 4,  43 => 3,  31 => 2,  19 => 1,);
    }
}
