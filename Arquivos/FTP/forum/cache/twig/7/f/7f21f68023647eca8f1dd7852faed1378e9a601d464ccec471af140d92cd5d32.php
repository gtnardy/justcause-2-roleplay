<?php

/* acp_upload.html */
class __TwigTemplate_7f21f68023647eca8f1dd7852faed1378e9a601d464ccec471af140d92cd5d32 extends Twig_Template
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
        if ((isset($context["S_ALLOW_CDN"]) ? $context["S_ALLOW_CDN"] : null)) {
            // line 2
            $asset_file = "//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
            $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
            if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
                $asset_path = $asset->get_path();                $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
                if (!file_exists($local_file)) {
                    $local_file = $this->getEnvironment()->findTemplate($asset_path);
                    $asset->set_path($local_file, true);
                $asset->add_assets_version('4');
                $asset_file = $asset->get_url();
                }
            }
            $context['definition']->append('STYLESHEETS', '<link href="' . $asset_file . '" rel="stylesheet" type="text/css" media="screen" />
');
        } else {
            // line 4
            $asset_file = (("" . (isset($context["ROOT_PATH"]) ? $context["ROOT_PATH"] : null)) . "ext/boardtools/upload/vendor/fortawesome/font-awesome/css/font-awesome.min.css");
            $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
            if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
                $asset_path = $asset->get_path();                $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
                if (!file_exists($local_file)) {
                    $local_file = $this->getEnvironment()->findTemplate($asset_path);
                    $asset->set_path($local_file, true);
                $asset->add_assets_version('4');
                $asset_file = $asset->get_url();
                }
            }
            $context['definition']->append('STYLESHEETS', '<link href="' . $asset_file . '" rel="stylesheet" type="text/css" media="screen" />
');
        }
        // line 6
        $asset_file = "css/jquery.qtip.min.css";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('STYLESHEETS', '<link href="' . $asset_file . '" rel="stylesheet" type="text/css" media="screen" />
');
        // line 7
        $asset_file = "css/upload.css";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('STYLESHEETS', '<link href="' . $asset_file . '" rel="stylesheet" type="text/css" media="screen" />
');
        // line 8
        if (((isset($context["S_CONTENT_DIRECTION"]) ? $context["S_CONTENT_DIRECTION"] : null) == "rtl")) {
            $asset_file = "css/upload.rtl.css";
            $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
            if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
                $asset_path = $asset->get_path();                $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
                if (!file_exists($local_file)) {
                    $local_file = $this->getEnvironment()->findTemplate($asset_path);
                    $asset->set_path($local_file, true);
                $asset->add_assets_version('4');
                $asset_file = $asset->get_url();
                }
            }
            $context['definition']->append('STYLESHEETS', '<link href="' . $asset_file . '" rel="stylesheet" type="text/css" media="screen" />
');
        }
        // line 9
        $location = "overall_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_header.html", "acp_upload.html", 9)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 10
        echo "
<div id=\"upload_ext_wrapper\">
\t<a name=\"maincontent\"></a>
\t<div id=\"upload_extensions_title_block\"><a href=\"";
        // line 13
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "\" id=\"upload_extensions_title\"><i class=\"fa fa-upload\"></i> ";
        echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_TITLE");
        echo "</a><div id=\"upload_extensions_title_links\"><a href=\"";
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "&amp;action=details\" class=\"upload_details_link\"><i class=\"fa fa-info-circle\"></i></a><a href=\"";
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "&amp;action=details&amp;ext_show=faq\" class=\"upload_faq_link\"><i class=\"fa fa-question-circle\"></i></a><span id=\"upload_extensions_links_show_slider\"><i class=\"fa fa-ellipsis-v\"></i></span></div></div>
\t<span class=\"upload_ext_error_show\" title=\"";
        // line 14
        echo $this->env->getExtension('phpbb')->lang("EXT_LOAD_ERROR_SHOW");
        echo "\"><i class=\"fa fa-warning\"></i></span>
\t";
        // line 15
        if (((isset($context["UPLOAD_EXT_NEW_UPDATE"]) ? $context["UPLOAD_EXT_NEW_UPDATE"] : null) &&  !(isset($context["S_UPLOAD_DETAILS"]) ? $context["S_UPLOAD_DETAILS"] : null))) {
            echo "<a href=\"";
            echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
            echo "&amp;action=details\" class=\"upload_details_link upload_ext_update_button upload_ext_updates_info_link\"><i class=\"fa fa-refresh\"></i> ";
            echo $this->env->getExtension('phpbb')->lang("EXT_UPDATES_AVAILABLE");
            echo "</a>";
        }
        // line 16
        echo "\t<p>";
        echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_EXT_DESCRIPTION");
        echo "</p>
\t<div id=\"upload_loading\"><span id=\"upload_loading_text\">";
        // line 17
        echo $this->env->getExtension('phpbb')->lang("LOADING");
        echo "</span><span id=\"upload_loading_status\"></span></div>
\t<div id=\"upload_loading_error_wrapper\" title=\"";
        // line 18
        echo $this->env->getExtension('phpbb')->lang("EXT_LOAD_ERROR_EXPLAIN");
        echo "\"><span id=\"upload_loading_error\">";
        echo $this->env->getExtension('phpbb')->lang("EXT_LOAD_ERROR");
        echo "</span><span id=\"upload_loading_timeout\">";
        echo $this->env->getExtension('phpbb')->lang("EXT_LOAD_TIMEOUT");
        echo "</span><span id=\"upload_loading_error_status\" data-load-error-solutions-title=\"";
        echo $this->env->getExtension('phpbb')->lang("POSSIBLE_SOLUTIONS");
        echo "\" data-load-error-solutions=\"";
        echo $this->env->getExtension('phpbb')->lang("EXT_LOAD_SOLUTIONS");
        echo "\"></span></div>
\t<div id=\"upload_main_wrapper\">
\t\t<div id=\"upload_main\" data-page-action=\"";
        // line 20
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "\" data-load-action=\"";
        echo (isset($context["S_LOAD_ACTION"]) ? $context["S_LOAD_ACTION"] : null);
        echo "\" data-page-url=\"";
        echo (isset($context["U_MAIN_PAGE_URL"]) ? $context["U_MAIN_PAGE_URL"] : null);
        echo "\">
\t\t\t";
        // line 21
        if ((isset($context["S_NEXT_STEP"]) ? $context["S_NEXT_STEP"] : null)) {
            // line 22
            echo "\t\t\t<div class=\"successbox notice\">
\t\t\t\t<p>";
            // line 23
            echo (isset($context["S_NEXT_STEP"]) ? $context["S_NEXT_STEP"] : null);
            echo "</p>
\t\t\t</div>
\t\t\t";
        } elseif (        // line 25
(isset($context["S_EXT_LIST"]) ? $context["S_EXT_LIST"] : null)) {
            // line 26
            echo "\t\t\t";
            $location = "acp_upload_list.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_list.html", "acp_upload.html", 26)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 27
            echo "\t\t\t";
        } elseif ((isset($context["S_ZIP_PACKAGES"]) ? $context["S_ZIP_PACKAGES"] : null)) {
            // line 28
            echo "\t\t\t";
            $location = "acp_upload_zip_packages.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_zip_packages.html", "acp_upload.html", 28)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 29
            echo "\t\t\t";
        } elseif ((isset($context["S_UNINSTALLED"]) ? $context["S_UNINSTALLED"] : null)) {
            // line 30
            echo "\t\t\t";
            $location = "acp_upload_uninstalled.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_uninstalled.html", "acp_upload.html", 30)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 31
            echo "\t\t\t";
        } elseif ((isset($context["S_DETAILS"]) ? $context["S_DETAILS"] : null)) {
            // line 32
            echo "\t\t\t";
            $location = "acp_upload_details.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_details.html", "acp_upload.html", 32)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 33
            echo "\t\t\t";
        } elseif ((isset($context["S_UPLOAD_DETAILS"]) ? $context["S_UPLOAD_DETAILS"] : null)) {
            // line 34
            echo "\t\t\t";
            $location = "acp_ext_details.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_ext_details.html", "acp_upload.html", 34)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 35
            echo "\t\t\t";
        } elseif ((isset($context["S_EXT_ERROR"]) ? $context["S_EXT_ERROR"] : null)) {
            // line 36
            echo "\t\t\t";
            $location = "acp_upload_error.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_error.html", "acp_upload.html", 36)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 37
            echo "\t\t\t";
        } else {
            // line 38
            echo "\t\t\t";
            $location = "acp_upload_main.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_main.html", "acp_upload.html", 38)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 39
            echo "\t\t\t";
        }
        // line 40
        echo "\t\t\t<br style=\"clear:both\" />
\t\t</div>
\t</div>
</div>
<div id=\"upload_temp_container\"></div>
<div id=\"upload_modal_box_wrapper\"><div id=\"upload_modal_box\"></div></div>
<div id=\"upload_refresh_notice_wrapper\"><div id=\"upload_refresh_notice\"><i class=\"fa fa-warning\"></i><span>";
        // line 46
        echo $this->env->getExtension('phpbb')->lang("EXT_REFRESH_NOTICE");
        echo "</span><a href=\"";
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "\" class=\"page_refresh_link\"><i class=\"fa fa-refresh\"></i> ";
        echo $this->env->getExtension('phpbb')->lang("EXT_REFRESH_PAGE");
        echo "</a><span class=\"upload_refresh_notice_close\">&times;</span></div></div>

";
        // line 48
        $asset_file = "js/php_file_tree_jquery.js";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('SCRIPTS', '<script type="text/javascript" src="' . $asset_file. '"></script>

');
        // line 49
        $asset_file = "js/jquery.form.js";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('SCRIPTS', '<script type="text/javascript" src="' . $asset_file. '"></script>

');
        // line 50
        $asset_file = "js/jquery.qtip.min.js";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('SCRIPTS', '<script type="text/javascript" src="' . $asset_file. '"></script>

');
        // line 51
        $asset_file = "js/loading_progress.js";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('SCRIPTS', '<script type="text/javascript" src="' . $asset_file. '"></script>

');
        // line 52
        $asset_file = "js/upload.js";
        $asset = new \phpbb\template\asset($asset_file, $this->getEnvironment()->get_path_helper());
        if (substr($asset_file, 0, 2) !== './' && $asset->is_relative()) {
            $asset_path = $asset->get_path();            $local_file = $this->getEnvironment()->get_phpbb_root_path() . $asset_path;
            if (!file_exists($local_file)) {
                $local_file = $this->getEnvironment()->findTemplate($asset_path);
                $asset->set_path($local_file, true);
            $asset->add_assets_version('4');
            $asset_file = $asset->get_url();
            }
        }
        $context['definition']->append('SCRIPTS', '<script type="text/javascript" src="' . $asset_file. '"></script>

');
        // line 53
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "acp_upload.html", 53)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "acp_upload.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  380 => 53,  365 => 52,  350 => 51,  335 => 50,  320 => 49,  305 => 48,  296 => 46,  288 => 40,  285 => 39,  272 => 38,  269 => 37,  256 => 36,  253 => 35,  240 => 34,  237 => 33,  224 => 32,  221 => 31,  208 => 30,  205 => 29,  192 => 28,  189 => 27,  176 => 26,  174 => 25,  169 => 23,  166 => 22,  164 => 21,  156 => 20,  143 => 18,  139 => 17,  134 => 16,  126 => 15,  122 => 14,  112 => 13,  107 => 10,  95 => 9,  79 => 8,  65 => 7,  51 => 6,  36 => 4,  21 => 2,  19 => 1,);
    }
}
