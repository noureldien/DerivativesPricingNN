%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1: draw theresults we got from Q 1_a, b ,...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% plot the sigma and prices
% figure(1);clf;
% hold on;
% grid on;
% box on;
% plot(estmPrices(:,1:5), 'r');
% plot(prices(nTest+1:nTest+nTrain,1:5), 'b');
% plot(abs(estmPrices(:,1:5)-prices(nTest+1:nTest+nTrain,1:5)), 'k');
% plot(sigmaValues(:,6:10));

%% plot the gaussian mixture model
% figure(2);clf;
% hold on;
% grid on;
% box on;
%ezcontour(@(x1,x2)pdf(gmm,[x2, x1]),get(gca,{'XLim','YLim'}));
% plot(ttm, sx(:,1), '.r');
% title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}');

%% another testing plot
% figure(3);clf;
% hold on;
% grid on;
% box on;
%plot(ttmTrain, sxTrain, 'b');
% plot(ttmTrain, sxTrain(:,1), '.r');
% plot(ttmTrain, sxTrain(:,2), '.b');
% plot(ttmTrain, sxTrain(:,3), '.k');

%% plot the errors in estimating the price using RBF
% figure(1); clf;
% hold on;
% grid on;
% plot(cxEstm, cx(:,1), '.');
% daspect([1,1,1]);
% return;
% errorRate = mean(errorTrain.^2);
% disp(['Mean Square Error (Train): ' num2str(errorRate)]);

%% plot prices and errors
% for i=1:5
%     figure(i);clf;
%     hold on;
%     grid on;
%     box on;
%     plot(ttmTrain, cxTrain(:,i), 'k');
%     plot(ttmTrain, cxTrainBS(:,i), 'r');
%     plot(ttmTrain, cxTrainRBF(:,i), 'b');
%     %axis([0, 0.7, -0.04, 0.04]);
%     %plot(ttmTrain, errorTrainBS, 'r');
%     %plot(ttmTrain, errorTrain, 'b');
% end
% return;

% for i=1:5
%     figure(i);clf;
%     hold on;
%     grid on;
%     box on;
%     plot([ttmTrain;ttmTest],[cxTrain(:,i);cxTest(:,i)], 'k');
%     plot([ttmTrain;ttmTest],[cxTrainRBF(:,i);cxTestRBF(:,i)], 'b');
% end
% return;

%% plot figure 4 in the paper
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, cxTrainBS(:,i)];
% end
% figure(6);clf;
% colormap = lines(10);
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', 'none', 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, cxTrainBS(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% %plot3(plotData(:,1), plotData(:,2), plotData(:,3),'o', 'MarkerFaceColor', 'k', 'Color', 'none', 'MarkerSize', 6);
% %plot_fill = fill3(sxTrain(:,i), ttmTrain, cxTrainRBF(:,i), '.', 'FaceColor', 'r', 'EdgeColor', 'r');
% %alpha(plot_fill, 0.35);
% %plot_tri = delaunay(sxTrain(:,1), ttmTrain);
% %trisurf(plot_tri, sxTrain(:,1), ttmTrain, cxTrainBS(:,1), 'EdgeColor', 'k', 'FaceColor', 'none');
% hold off;
% grid on;
% %box on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('C/X', 'FontSize', 18);
% title('Simulated option prices using Black-Schole', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'nw');
% set(plot_legend, 'FontSize', 14);
% return;

%% plot errors of training using box plot
% figure(7);clf;
% subplot(1,3,1);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrainBS));
% ylim([0 0.032]);
% title('BS Model - Actual', 'FontSize', 14);
% subplot(1,3,2);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrain));
% ylim([0 0.032]);
% title('RBF Network - Actual', 'FontSize', 14);
% subplot(1,3,3);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrainRBF));
% ylim([0 0.032]);
% title('RBF Network - BS Model', 'FontSize', 14);

%% plot errors of testing using box plot
% figure(7);clf;
% subplot(1,3,1);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrainBS));
% ylim([0 0.032]);
% title('BS Model - Actual', 'FontSize', 14);
% subplot(1,3,2);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrain));
% ylim([0 0.032]);
% title('RBF Network - Actual', 'FontSize', 14);
% subplot(1,3,3);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrainRBF));
% ylim([0 0.032]);
% title('RBF Network - BS Model', 'FontSize', 14);
% 
% figure(1);clf;
% subplot(1,2,1);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTrain));
% ylim([0 0.03]);
% title('RBF Training Error', 'FontSize', 14);
% subplot(1,2,2);
% hold on;
% grid on;
% box on;
% boxplot(abs(errorTest));
% ylim([0 0.03]);
% title('RBF Test Error', 'FontSize', 14);

%% plot RBF pricing and it's error in 3D
% figure(8);clf;
% colormap = lines(10);
% colorGray = [0.4 0.4 0.4];
% colorGray = 'none';
% subplot(1,2,1);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, cxTrainRBF(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, cxTrainRBF(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{RBF Prices $\widehat{C}/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'nw');
% set(plot_legend, 'FontSize', 12);
% subplot(1,2,2);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, errorTrainRBF(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, errorTrainRBF(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X -C/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{Error $\widehat{C}/X - C/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'ne');
% set(plot_legend, 'FontSize', 12);
% return;

%% plot PPR pricing and it's error in 3D
% figure(8);clf;
% nOption = 10;
% colormap = lines(10);
% colorGray = 'none';
% subplot(1,2,1);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, cxTrainPPR(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, cxTrainPPR(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{PPR Prices $\widehat{C}/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'nw');
% set(plot_legend, 'FontSize', 12);
% subplot(1,2,2);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, errorTrainPPR(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, errorTrainPPR(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X -C/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{Error $\widehat{C}/X - C/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'ne');
% set(plot_legend, 'FontSize', 12);
% return;

%% plot SVR pricing and it's error in 3D
% figure(8);clf;
% nOption = 10;
% colormap = lines(10);
% colorGray = 'none';
% subplot(1,2,1);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, cxTrainSVR(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, cxTrainSVR(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{SVR Prices $\widehat{C}/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'nw');
% set(plot_legend, 'FontSize', 12);
% subplot(1,2,2);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, errorTrainSVR(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', colorGray, 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, errorTrainSVR(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{C}/X -C/X$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{Error $\widehat{C}/X - C/X$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'ne');
% set(plot_legend, 'FontSize', 12);
% return;

%% plot delta and it's error in 3D
% colormap = lines(10);
% figure(9);clf;
% subplot(1,2,1);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, deltas(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', 'none', 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, deltas(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{\Delta}$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{Delta Estimates $\widehat{\Delta}$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'nw');
% set(plot_legend, 'FontSize', 12);
% subplot(1,2,2);
% plotData = zeros(0, 3);
% for i=1:nOption/2
%     plotData = [plotData; sxTrain(:,i), ttmTrain, errorDelta(:,i)];
% end
% hold all;
% plot_tri = delaunay(plotData(:,1), plotData(:,2));
% plot_fill = trisurf(plot_tri, plotData(:,1), plotData(:,2), plotData(:,3), 'EdgeColor', 'none', 'FaceColor', 'k');
% alpha(plot_fill, 0.25);
% plots = zeros(nOption/2, 1);
% for i=1:nOption/2
%     plots(i) = plot3(sxTrain(:,i), ttmTrain, errorDelta(:,i),'o', 'MarkerFaceColor', colormap(i,:), 'Color', 'none', 'MarkerSize', 6);
% end
% hold off;
% grid on;
% xlabel('S/X', 'FontSize', 18);
% ylabel('T-t', 'FontSize', 18);
% zlabel('$\widehat{\Delta} - \Delta$', 'Interpreter','Latex', 'FontSize', 18);
% title('\textsf{Error $\widehat{\Delta} - \Delta$}', 'Interpreter','Latex', 'FontSize', 18);
% plot_legend = legend(plots, {'Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'}, 'Location', 'ne');
% set(plot_legend, 'FontSize', 12);

%% draw the prices predicted by all the networks (RBF, MLP, PPR, SVR)
% for i=1:5
%     figure(i);clf;
%     hold on;
%     grid on;
%     box on;
%     plot(cxTrain(:,i), 'k', 'LineWidth', 2);
%     plot(cxTrainRBF(:,i), 'b');
%     plot(cxTrainMLP(:,i), 'g');
%     plot(cxTrainMLP(:,i), 'r');
%     plot(cxTest(:,i), 'k', 'LineWidth', 2);
%     plot(cxTestRBF(:,i), 'b');
%     plot(cxTestMLP(:,i), 'g');
%     plot(cxTestMLP(:,i), 'r');
% end

%% plot error rates for all the networks
% figure(1); clf;
% subplot(1,2,1);
% hold on;
% grid on;
% box on;
% boxplot([ mean(abs(errorTrain))', mean(abs(errorTrainMLP))', mean(abs(errorTrainPPR))', mean(abs(errorTrainSVR))']);
% ylim([0 0.03]);
% xlabel('RBF    MLP    PPR    SVR', 'FontSize', 14);
% ylabel('Absolute Error', 'FontSize', 14);
% title('Error (Training Data)', 'FontSize', 14);
% subplot(1,2,2);
% hold on;
% grid on;
% box on;
% boxplot([ mean(abs(errorTest))', mean(abs(errorTestMLP))', mean(abs(errorTestPPR))', mean(abs(errorTestSVR))']);
% ylim([0 0.03]);
% xlabel('RBF    MLP    PPR    SVR', 'FontSize', 14);
% ylabel('Absolute Error', 'FontSize', 14);
% title('Error (Test Data)', 'FontSize', 14);
% 
% colormap = lines(4);
% graycolor = 'k';
% figure(2);clf;
% subplot(1,2,1);
% hold on;
% grid on;
% box on;
% plot(mean(abs(errorTrain)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTrain)), '.', 'MarkerSize', 15, 'Color', colormap(1,:));
% plot(mean(abs(errorTrainMLP)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTrainMLP)), '.', 'MarkerSize', 15, 'Color', colormap(2,:));
% plot(mean(abs(errorTrainPPR)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTrainPPR)), '.', 'MarkerSize', 15, 'Color', colormap(3,:));
% plot(mean(abs(errorTrainSVR)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTrainSVR)), '.', 'MarkerSize', 15, 'Color', colormap(4,:));
% plot1 = plot(5, '^', 'LineWidth', 1, 'MarkerFaceColor', colormap(1,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% plot2 = plot(5, '*', 'LineWidth', 2, 'MarkerFaceColor', colormap(2,:), 'MarkerEdgeColor', colormap(2,:), 'MarkerSize', 10);
% plot3 = plot(5, 's', 'LineWidth', 1, 'MarkerFaceColor', colormap(3,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% plot4 = plot(5, 'o', 'LineWidth', 1, 'MarkerFaceColor', colormap(4,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% ylim([0 0.03]);
% xlabel('Call Option', 'FontSize', 14);
% ylabel('Absolute Error', 'FontSize', 14);
% title('Error (Training Data)', 'FontSize', 14);
% fig_legend = legend([plot1, plot2, plot3, plot4], {'RBF', 'MLP', 'PPR', 'SVR'}, 'Location', 'northwest');
% set(fig_legend,'FontSize',12);
% subplot(1,2,2);
% hold on;
% grid on;
% box on;
% plot(mean(abs(errorTest)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTest)), '^', 'LineWidth', 1, 'MarkerFaceColor', colormap(1,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% plot(mean(abs(errorTestMLP)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTestMLP)), '*', 'LineWidth', 2, 'MarkerFaceColor', colormap(2,:), 'MarkerEdgeColor', colormap(2,:), 'MarkerSize', 10);
% plot(mean(abs(errorTestPPR)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTestPPR)), 's', 'LineWidth', 1, 'MarkerFaceColor', colormap(3,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% plot(mean(abs(errorTestSVR)), '--.', 'LineWidth', 1, 'Color', graycolor);
% plot(mean(abs(errorTestSVR)), 'o', 'LineWidth', 1, 'MarkerFaceColor', colormap(4,:), 'MarkerEdgeColor', 'k', 'MarkerSize', 10);
% ylim([0 0.03]);
% xlabel('Call Option', 'FontSize', 14);
% ylabel('Absolute Error', 'FontSize', 14);
% title('Error (Test Data)', 'FontSize', 14);










