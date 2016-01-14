<?php

/* ucp_footer.html */
class __TwigTemplate_5f280234d5637e4cbafbe6c5cdb00bffea2ca119f08be3c71e3bc598f045aac0 extends Twig_Template
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
        echo "\t  </div>
 </div>
<!-- col-md-12 ucp_header
</div>
-->
\t<div class=\"clear\"></div>

\t</div>
\t</div>
</div>
</div>
";
        // line 12
        if ((isset($context["S_COMPOSE_PM"]) ? $context["S_COMPOSE_PM"] : null)) {
            // line 13
            echo "<div>";
            echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
            echo "</div>
</form>
</div>
";
        }
        // line 17
        $location = "jumpbox_options.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("jumpbox_options.html", "ucp_footer.html", 17)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 18
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "ucp_footer.html", 18)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 19
        echo "
";
        // line 20
        if ((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "friends_online", array())) || twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "friends_offline", array())))) {
            // line 21
            echo "<script>
// lets load and call the function only if there is an user added as a friend
head.load(\"";
            // line 23
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/vendors/jquery.tinyscrollbar.min.js\");
head.ready('jquery.tinyscrollbar.min.js', function() {
    \$(\"#scrollbar-two\").tinyscrollbar();
});
</script>
";
        }
        // line 29
        echo "<script>
 head.load(\"";
        // line 30
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/vendors/jupload.min.js\");
</script>
";
    }

    public function getTemplateName()
    {
        return "ucp_footer.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  87 => 30,  84 => 29,  75 => 23,  71 => 21,  69 => 20,  66 => 19,  54 => 18,  42 => 17,  34 => 13,  32 => 12,  19 => 1,);
    }
}
