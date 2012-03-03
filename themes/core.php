<?php
/*
 * Проект: Katrin
 * Шаблонизатор (сборка 3)
 */

if (!defined('Katrin'))
    die ('Access Error');

// Создаем объект шаблонизатора
$current_theme = 'default';			    // TODO из настроек
$tpl_loader = new TemplateLoader($current_theme);
$page_areas = array();


/**
 * Класс-шаблонизатор 
 */
class TemplateLoader
{
    public $full_tpls_path;
    public $local_scripts;
    public $local_theme_scripts;
    private $_vars = array();
    
    /**
     *
     * @param type $current_theme название текущей темы
     */
    public function __construct($current_theme = 'default') 
    {
	$this->full_tpls_path = 'themes/'.$current_theme;
        $this->local_scripts='';
        
    }
    
    public function __get($name)
    {
	if (isset($this->_vars[$name])) 
	    return $this->_vars[$name];
	return '';
    }
    
    /**
     *устанавливает локальный скрипт НЕ из папки themes/<curretn theme>
     * @param type $a абсолютный путь 
     */
    public function set_local_scripts($a)
    {
        $this->local_scripts=$a;
    }
    
    /**
     *устанавливает локальный скрипт из папки themes/<curretn theme>
     * @param type $a массив имен скриптов с расширениями, которые лежат в themes/<curretn theme>
     */
    public function set_local_theme_scripts($a)
    {
        global $current_theme;
        $str='';
        for ($i=0;$i<count($a);$i++)
        {
            
            $str.='</script><script type="text/javascript" src="themes/'.$current_theme.'/'.$a[$i].'"></script>';
        }
        $this->local_theme_scripts=$str;
    }

    /**
     * Заполняет один шаблон
     * @param string $current_tpl требуемый для заполнения шаблон
     * @param array $vars ассоциативный массив переменных
     * @return string Заполненный шаблон 
     */
    public function Load($current_tpl, $vars=NULL) //TODO возможны значения по умолчанию
    {	
	// добавляем расширение, если нет
	if (preg_match('/.tpl$/', $current_tpl) == 0)
	    $current_tpl.='.tpl';
	
	$this->_vars = $vars;
	
	// проверяем на наличие шаблона:
	if (!file_exists($this->full_tpls_path.'/'.$current_tpl)) 
	    die('Шаблона '.$this->full_tpls_path.'/'.$current_tpl.' не существует!');

	// загружаем шаблон
	ob_start();
	include($this->full_tpls_path."/".$current_tpl);
	return ob_get_clean();
    }
}

?>
