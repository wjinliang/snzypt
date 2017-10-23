package com.dm.cms.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

public class ImageUtils {

    public static void markImageByIcon(String iconPath, String srcImgPath,   
    		int num,String targerPath) {   
    	markImageByIcon(iconPath, srcImgPath, targerPath,num, null); 
    	System.out.println(iconPath+"-"+srcImgPath+"-"+targerPath);
    }   
  
    /**  
     * 给图片添加水印、可设置水印图片旋转角度  
     * @param iconPath 水印图片路径  
     * @param srcImgPath 源图片路径  
     * @param targerPath 目标图片路径  
     * @param degree 水印图片旋转角度  
     */  
    public static void markImageByIcon(String iconPath, String srcImgPath,   
            String targerPath,int num,Integer degree) {   
        OutputStream os = null;   
        try {   
            Image srcImg = ImageIO.read(new File(srcImgPath));   
  
            BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),   
                    srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);   
  
            // 得到画笔对象   
            // Graphics g= buffImg.getGraphics();   
            Graphics2D g = buffImg.createGraphics();   
  
            // 设置对线段的锯齿状边缘处理   
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,   
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR);   
            int x=0; int y=0;
            
            g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg   
                    .getHeight(null), Image.SCALE_SMOOTH), 0,0, null);   
  
            if (null != degree) {   
                // 设置水印旋转   
                g.rotate(Math.toRadians(degree),   
                        (double) buffImg.getWidth() / 2, (double) buffImg   
                                .getHeight() / 2);   
            }   
  
            // 水印图象的路径 水印一般为gif或者png的，这样可设置透明度   
            ImageIcon imgIcon = new ImageIcon(iconPath);   
  
            // 得到Image对象。   
            Image img = imgIcon.getImage();   
  
            float alpha = 0.5f; // 透明度   
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,   
                    alpha));   
  
            // 表示水印图片的位置  
            if(num==3)
            {
            	x = 0;
            	y = srcImg.getHeight(null)-img.getHeight(null)-5;
            }
            else if(num==2)
            {
            	x= srcImg.getWidth(null)-img.getWidth(null)-5;
                y=0;
            }
            else if(num==1)
            {
            	x =srcImg.getWidth(null)-img.getWidth(null)-5;
            	y = srcImg.getHeight(null)-img.getHeight(null)-5;
            }
            g.drawImage(img, x, y, null);   
  
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));   
  
            g.dispose();   
  
            os = new FileOutputStream(targerPath);   
  
            // 生成图片   
            ImageIO.write(buffImg, "JPG", os);   
  
            System.out.println("图片完成添加Icon印章。。。。。。");   
        } catch (Exception e) {   
            e.printStackTrace();   
        } finally {   
            try {   
                if (null != os)   
                    os.close();   
            } catch (Exception e) {   
                e.printStackTrace();   
            }   
        }   
    }   
    public static void main(String[] args) {
		String icon = "E:/develop/tomcatpro7/webapps/html/resource/upload/tXjFPAjeM5vV9yal/image/20160927/boat1.png";
	    String srcimg = "E:/develop/tomcatpro7/webapps/html/resource/upload/tXjFPAjeM5vV9yal/image/20160927/20160927163559_910_2.png";
	    markImageByIcon(icon,srcimg,srcimg,1,null);
    }
}
