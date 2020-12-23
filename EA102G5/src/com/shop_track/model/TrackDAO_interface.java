package com.shop_track.model;

import java.util.List;

public interface TrackDAO_interface {
	
	public void insert(TrackVO trackVO);
    public void update(TrackVO trackVO);
    
    public TrackVO findByPrimaryKey(String mem_no, String prod_no);
    public List<TrackVO> getAll();
    
    public List<TrackVO> getMemTrack(String mem_no); 
    public void deleteTrack(TrackVO trackVO);

}
