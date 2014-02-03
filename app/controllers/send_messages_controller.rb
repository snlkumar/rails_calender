class SendMessagesController < ApplicationController
  # GET /send_messages
  # GET /send_messages.xml
  require 'rubygems'
  require 'clickatell'
  def index
    @send_messages = SendMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @send_messages }
    end
  end
  
  def send_message_to
    @send_message = SendMessage.new
  end

  # GET /send_messages/1
  # GET /send_messages/1.xml
  def show
    @send_message = SendMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @send_message }
    end
  end

  # GET /send_messages/new
  # GET /send_messages/new.xml
  def new
    @send_message = SendMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @send_message }
    end
  end

  # GET /send_messages/1/edit
  def edit
    @send_message = SendMessage.find(params[:id])
  end

  # POST /send_messages
  # POST /send_messages.xml
  def create
    @send_message = SendMessage.new(params[:send_message])

    respond_to do |format|
      if @send_message.save
        api = Clickatell::API.authenticate(3463141, "sunil.kumar", "HGDSeKESQDOJcP")
        api.send_message('917696099799', 'Hello from clickatell')
        puts api
        format.html { redirect_to(@send_message, :notice => 'Send message was successfully created.') }
        format.xml  { render :xml => @send_message, :status => :created, :location => @send_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @send_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /send_messages/1
  # PUT /send_messages/1.xml
  def update
    @send_message = SendMessage.find(params[:id])

    respond_to do |format|
      if @send_message.update_attributes(params[:send_message])
        format.html { redirect_to(@send_message, :notice => 'Send message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @send_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /send_messages/1
  # DELETE /send_messages/1.xml
  def destroy
    @send_message = SendMessage.find(params[:id])
    @send_message.destroy

    respond_to do |format|
      format.html { redirect_to(send_messages_url) }
      format.xml  { head :ok }
    end
  end
end
