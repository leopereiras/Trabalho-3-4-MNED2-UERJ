f = figure('Color', 'white', 'Name', 'Trabalho 3 e 4 - MNED2', 'WindowState', 'maximized');

% Adicionar botões separados do gráfico
btn1 = uicontrol('Style', 'pushbutton', 'String', 'FTBS',...
    'Position', [50, 20, 80, 30],...
    'Callback', @botao_Callback);

btn2 = uicontrol('Style', 'pushbutton', 'String', 'VanLeer',...
    'Position', [150, 20, 80, 30],...
    'Callback', @botao_Callback2);

btn3 = uicontrol('Style', 'pushbutton', 'String', 'HQUICK',...
    'Position', [250, 20, 80, 30],...
    'Callback', @botao_Callback3);

btn4 = uicontrol('Style', 'pushbutton', 'String', 'Superbee',...
    'Position', [350, 20, 80, 30],...
    'Callback', @botao_Callback4);

btn5 = uicontrol('Style', 'pushbutton', 'String', 'BurgersConservativa',...
    'Position', [450, 20, 80, 30],...
    'Callback', @botao_Callback5);

btn6 = uicontrol('Style', 'pushbutton', 'String', 'BurgersNaoConservativa',...
    'Position', [550, 20, 80, 30],...
    'Callback', @botao_Callback6);

btn_limpar = uicontrol('Style', 'pushbutton', 'String', 'Refresh',...
    'Position', [1250, 20, 80, 30],...
    'Callback', @limpar_Callback);



% Função click dos botoes
function botao_Callback(hObject, eventdata)
        tic
    loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('ftbs.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
    % Esconder textos
    set(loading_text, 'Visible', 'off');
end
function botao_Callback2(hObject, eventdata)
    tic
    loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('vanleer.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
    % Esconder textos
    set(loading_text, 'Visible', 'off');
end
function botao_Callback3(hObject, eventdata)
    tic
    loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('hquick.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
    % Esconder textos
    set(loading_text, 'Visible', 'off');end
function botao_Callback4(hObject, eventdata)
    tic
    loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('superbee.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
    % Esconder textos
    set(loading_text, 'Visible', 'off');
end
function botao_Callback5(hObject, eventdata)
    tic
    choice = questdlg('Atenção aos parâmetros! Os métodos de burgers com os parâmetros dos métodos anteriores pode demorar a calcular e/ou travar', 'Atenção', 'Ok', 'Voltar', 'Voltar');
        
        switch choice
            case 'Ok'
                loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('burgersConservativa.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
     % Esconder textos
    set(loading_text, 'Visible', 'off');
                
            case 'Voltar'

                return
        end
    
end
function botao_Callback6(hObject, eventdata)
    tic
    choice = questdlg('Atenção aos parâmetros! Os métodos de burgers com os parâmetros dos métodos anteriores pode demorar a calcular e/ou travar', 'Atenção', 'Ok', 'Voltar', 'Voltar');
        
        switch choice
            case 'Ok'
                loading_text = uicontrol('Style', 'text', 'String', 'Carregando...',...
        'Position', [1150, 10, 80, 30], 'Visible', 'off');
    tempo_text = uicontrol('Style', 'text', 'String', '',...
        'Position', [950, 20, 160, 30], 'Visible', 'off');

     % Mostrar textos
        set(loading_text, 'Visible', 'on');
        set(tempo_text, 'Visible', 'on');
        drawnow; % Forçar a atualização da interface gráfica

    run('burgersNaoConservativa.m');
    tempo_processamento = toc;
    set(tempo_text, 'String', sprintf('Tempo_de_processamento: %f s', tempo_processamento)); 
    drawnow;
        
        
     % Esconder textos
    set(loading_text, 'Visible', 'off');
                
            case 'Voltar'

                return
        end
    
end


function limpar_Callback(hObject, eventdata)
    close(gcf);    
    run("interface.m");


end