# Bài tập truy vấn SQL: CRM Analysis
Khai thác dữ liệu => trả lời các câu hỏi => Insight

**1. Dữ liệu**

  - Dataset: dữ liệu Quan hệ Khách hàng
  - Nguồn: có sẵn từ 1 khóa học
  - Mô tả: định dạng csv, 495 bản ghi (record), 8 trường thông tin gồm
      - Date: từ tháng 05/2021 - 12/2021
      - Scheme Name
      - Store Name
      - Item Name
      - Member Account Code
      - Invoice: Mã giao dịch
      - Sales Qty: Số lượng
      - Sales Amt: Doanh số (VNĐ)
        
**2. Công cụ sử dụng**

  - Hệ quản trị cơ sở dữ liệu: MySQL
  - Công cụ: Excel, DBeaver
  - Ngôn ngữ: SQL
    
**3. Quy trình thực hiện**

  - Import dữ liệu vào MySql thông qua DBeaver: chuẩn hóa dữ liệu...
  - Khám phá dữ liệu bằng truy vấn SQL trên DBeaver để trả lời các câu hỏi
  - Trực quan hóa dữ liệu bằng PivotChart trên Excel

**4. Kết quả và Insight**
    
- Phân khúc **Clienteling** ($3K - <$10K) có **doanh số cao nhất** (29,62%) và số lượng giao dịch từ 2 mặt hàng trở lên lớn nhất (50%).
- Từ tháng 5 đến tháng 9, doanh số, tổng số khách hàng, tổng số mặt hàng bán ra và tổng số giao dịch đều giảm (tháng 8 không ghi nhận thống kê).
- **Tháng 10**, các chỉ số này tăng vọt, với **tổng số khách hàng, tổng số giao dịch và tổng số mặt hàng bán ra đạt mức cao nhất trong năm**.
- **Tháng 12 có doanh số cao nhất trong năm (26,90%)**, mặc dù số lượng khách hàng, giao dịch và số mặt hàng bán ra đều giảm. Tiếp theo là tháng 10 (25,21%).
- Chương trình: **Platinum và Member chiếm phần lớn doanh số (84,68%)** và số mặt hàng bán ra (82,82%). Trong đó, **Platinum mang lại doanh số cao nhất (71,81%)** và số lượng mặt hàng bán ra lớn nhất (42,24%).
- Biến thiên doanh số từ tháng 5 đến tháng 12 năm 2021 tương đồng như biến thiên doanh số của Platinum Scheme.

<img height="230" align="center" src="https://github.com/user-attachments/assets/a517181a-81f6-4d74-a252-21cc39c949b0" /></br>
<div align="center">  
<img src="https://github.com/user-attachments/assets/999962ff-09a3-4b4b-9496-0947f73c6466" height="230" align="center">
<img src="https://github.com/user-attachments/assets/3dfc3dfe-50d5-4bef-94c1-1c377e44bd91" height="230" align="center">
</div>
</br>
<div align="center">
<img src="https://github.com/user-attachments/assets/6953c301-7ea9-42f7-9b0e-3c96fc63ce0a" height="230" align="center">  
<img src="https://github.com/user-attachments/assets/3c6dedb2-1e55-44ca-836f-f976a8dcd3fb" height="230" align="center">
</div>
