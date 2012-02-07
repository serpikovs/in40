<?php
/*
 * Проект: Katrin
 * Класс для засекания времени выполнения кода
 * 1. Создать объект
 * 2. $->Start() в начале кода
 * 3. $->End() в конце кода (возвращает время)
 */

class StopWatch
{
    private $_start;
    private $_end;
    private $_span;
    
    public function Start()
    {
	$this->_span = 0;
	
	$mtime = microtime();
	$mtime = explode(' ', $mtime);
	$this->_start = $mtime[1] + $mtime[0]; 
    }
    
    public function Pause()
    {
	$mtime = microtime(); 
	$mtime = explode(" ",$mtime); 
	$mtime = $mtime[1] + $mtime[0]; 
	$this->_end = $mtime; 
	$this->_span += $this->_end - $this->_start;
	return $this->_span;
    }
    
    public function Resume()
    {
	$mtime = microtime();
	$mtime = explode(" ", $mtime);
	$this->_start = $mtime[1] + $mtime[0]; 
    }
    
    public function End()
    {
	return $this->Pause();
    }  
}

?>
