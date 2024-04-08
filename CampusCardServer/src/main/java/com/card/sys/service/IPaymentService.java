package com.card.sys.service;

import com.card.common.vo.Result;
import com.card.sys.entity.Payment;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-19
 */
public interface IPaymentService extends IService<Payment> {

    void addPayment(Payment payment);

    void updatePayment(Payment payment);

    void deletePaymentById(Integer id);

    Payment getPaymentById(Integer id);

    Result buyPaymentById(Payment payment,Integer id);
}
