package com.devpro.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Bill_Customer;
import com.devpro.entities.Images_attachment;
import com.devpro.entities.Post_Product_detail;
import com.devpro.repository.Bill_CustomerRepository;
import com.devpro.repository.CategoryRepository;
import com.devpro.repository.Post_productRepository;

@Controller
public class AdminPostController {

	@Autowired
	Post_productRepository postRepository;             // inject cái này vào để gọi ipa ra vận chuyển dữ liệu
	@Autowired
	CategoryRepository categoryRepository;
	


	@Value("${file.upload.path}") private String attachmentPath;                 // đường dẫn chỉ tới file upload chứa các file ảnh

	@RequestMapping(value = { "/admin/add-post-product" }, method = { RequestMethod.GET })
	public String product(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		 // add 2 Attribute này vào model để gọi (mapping) bên file add_post_product.jsp
		model.addAttribute("post-product", new Post_Product_detail());            
		model.addAttribute("categories", categoryRepository.findAll());			
		return "admin/add_post_product";
	}

	// phương thức này để mapping đến chỗ chèn thêm các file (ảnh, link ..) từ máy tính vào
	@RequestMapping(value = "/admin/add-post-product", method = RequestMethod.POST)   
	public String saveproduct(@RequestParam("postImage") MultipartFile[] postImage,
							  
			@ModelAttribute("post-product") Post_Product_detail post_Product_detail,
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IllegalStateException, IOException {
		
		post_Product_detail.setGiaFormat();  // format lại giá tiền vd: 10000000 -> 10.000.000
		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("status", "success");
		if (postImage != null && postImage.length > 0) {
			
			for (MultipartFile multipartFile : postImage) {
				
				if(multipartFile.getSize() <= 0) continue;
				
				Images_attachment images_Attachment = new Images_attachment(); // gọi ra đối tượng này để lưu dữ liệu vào bảng
																	       // images_ttachment trong database
				images_Attachment.setName(multipartFile.getOriginalFilename());
				images_Attachment.setMime(multipartFile.getContentType());
				images_Attachment.setPath(attachmentPath);
				post_Product_detail.addImages_attachment(images_Attachment);
	
				// lưu file vào folder trên server.
				// E:/                                  /upload/abc.jpeg
				multipartFile.transferTo(new File(attachmentPath + "/" + multipartFile.getOriginalFilename()));
				}
			
		}

		post_Product_detail.setCreatedDate(new Date());
		postRepository.save(post_Product_detail);

		return "admin/add_post_product";
	}
	
	@RequestMapping(value = { "/admin/list-product" }, method = { RequestMethod.GET })
	public String listProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) {
		List<Post_Product_detail> products = postRepository.findAll();
		model.addAttribute("products", products);    
				
		return "admin/list_product";
	}
	
	private int idProductEdit;
	@RequestMapping(value = { "/admin/edit-product/{productId}" }, method = { RequestMethod.GET })
	public String editProduct(@PathVariable int productId, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		Post_Product_detail product= postRepository.getOne(productId);
		model.addAttribute("product", product);
		model.addAttribute("categories", categoryRepository.findAll());
		idProductEdit = productId;
		// trả về tên view.
		return "admin/edit_product";
	}
	
	@RequestMapping(value = { "/admin/edit-product" }, method = { RequestMethod.POST })
	public String saveUpdateProduct(@RequestParam("postImage") MultipartFile[] postImage,
			@ModelAttribute("product") Post_Product_detail product, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) throws IllegalStateException, IOException {
		
		product.setGiaFormat();
//		Post_Product_detail product1 = postRepository.getOne(idProductEdit);
//		if (postImage != null && postImage.length > 0) {
//			
//			for (int i = 0; i < postImage.length; i++) {   // nếu admin thêm vào x ảnh thì phải xóa bỏ x ảnh trong DB để đảm bảo luôn có 5 ảnh với mỗi sản phẩm
//				
//				product1.getImages_attachments().remove(i);
//				System.out.println("---------------------- xóa 1 lần nhé :)=================");
//			}
//			
//			System.out.println();
//			System.out.println("==============================" + postImage.length);
//			System.out.println();
//			for (MultipartFile multipartFile : postImage) {
//				
//				if(multipartFile.getSize() <= 0) continue;
//				
//				Images_attachment images_Attachment = new Images_attachment(); // gọi ra đối tượng này để lưu dữ liệu vào bảng
//																	       // images_ttachment trong database
//				images_Attachment.setName(multipartFile.getOriginalFilename());
//				images_Attachment.setMime(multipartFile.getContentType());
//				images_Attachment.setPath(attachmentPath);
//				product.addImages_attachment(images_Attachment);
//	
//				// lưu file vào folder trên server.
//				// E:/                                  /upload/abc.jpeg
//				multipartFile.transferTo(new File(attachmentPath + "/" + multipartFile.getOriginalFilename()));
//				}
//			
//		}
		product.setCreatedDate(new Date());
		postRepository.save(product);

		// trả về tên view.
		return listProduct(model,request,response);
	}
	
}
