package com.card.sys.service;

import com.card.sys.entity.Library;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-22
 */
public interface ILibraryService extends IService<Library> {

    void addSeat(Library seat);

    void updateSeat(Library seat);

    Library getSeatById(Integer id);

    void deleteSeatById(Integer id);


}
